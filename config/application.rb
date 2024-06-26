require_relative "boot"

require "rails/all"
require "action_text"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
module ReaderWorld
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    config.active_storage.service
    config.active_record.schema_format = :sql
    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
    # config.action_text.allowed_tags = %w(h1 h2 h3 p div a ul ol li span)
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
