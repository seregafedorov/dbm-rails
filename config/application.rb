require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Dbm
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.exceptions_app = ->(env) { ErrorsController.action(:show).call(env) }

    config.i18n.available_locales = [:ru, :en]
    config.i18n.default_locale = :ru

    config.assets.precompile += %w( application.js index.css active_admin/active_admin_globalize_fix.js )

    config.assets.enabled = true
    config.assets.paths << Rails.root.join('vendor', 'assets', 'components')

  end
end
