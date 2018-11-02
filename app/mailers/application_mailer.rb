# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'no_reply@customer_support_center.com'
  layout 'mailer'
end
