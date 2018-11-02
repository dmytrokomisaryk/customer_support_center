# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CustomerSupportCenter
  class Application < Rails::Application
    config.to_prepare do
      DeviseController.respond_to :html, :json
    end
  end
end
