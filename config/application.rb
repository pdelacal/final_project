require_relative 'boot'

require 'rails/all'

config.session_store :cookie_store, key: '_interslice_session'
config.middleware.use ActionDispatch::Cookies # Required for all session management
config.middleware.use ActionDispatch::Session::CookieStore, config.session_options

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Apartment
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end

end
