require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Joynto
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.autoload_paths += %W(
      #{config.root}/app/models/channel/
    )
    config.app_generators.scaffold_controller = :scaffold_controller
    config.generators do |g|
      g.test_framework :rspec,
            view_specs: false,
            helper_specs: false,
            routing_specs: false
    end    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.fog_provider = 'fog/aws'
  end
end
