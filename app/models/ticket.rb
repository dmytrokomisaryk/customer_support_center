# frozen_string_literal: true

class Ticket < ApplicationRecord
  DEFAULT_PER_VALUE = 5

  has_many :feedbacks, dependent: :destroy

  default_scope { order(created_at: :desc) }

  enum state: { pending: 0, replied: 1 }

  validates :sender_name, :subject, :message, presence: true, allow_nil: false
  validates :reference, uniqueness: true
  validates :sender_email,
            presence: true, length: { maximum: 255 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  scope :w_query, ->(q) { where(sql_query_generator, query: q) if q.present? }
  scope :w_state, ->(state) { where(state: state) if state.present? }
  scope :count_by_params, lambda { |params|
    select(:id).w_query(params[:query]).w_state(params[:state]).count
  }

  def self.search(params = {})
    w_state(params[:state])
      .w_query(params[:query])
      .page(params[:page] || 1)
      .per(params[:per_page] || DEFAULT_PER_VALUE)
  end

  def self.sql_query_generator
    fields = %w[sender_name subject message reference]
    fields.map { |field| "#{field} ILIKE concat('%',:query,'%')" }.join(' OR ')
  end
end
