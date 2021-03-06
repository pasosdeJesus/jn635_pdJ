require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Jn635Pdj
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.hosts << ENV['CONFIG_HOSTS'] || '127.0.0.1'


    config.time_zone = 'America/Bogota'

    config.i18n.default_locale = :es

    config.railties_order = [:main_app, Sip::Engine, :all]

    # En el momento soporta 3: yyyy-mm-dd, dd-mm-yyyy y dd/M/yyyy
    config.x.formato_fecha = 'dd/M/yyyy'

    config.colorize_logging = true

    config.active_record.schema_format = :sql

    config.hosts << ENV['CONFIG_HOSTS'] || '127.0.0.1'

    config.relative_url_root = "/mercadocampesino"

    #config.web_console.whitelisted_ips = ['186.154.35.237']
   

  end
end
