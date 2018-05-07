require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PortfolioApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    # config.autoload_paths += %W(#{config.root}/controllers/concerns/)

    # config.eager_load_paths << Rails.root.join('controllers/concerns/**')
    # config.eager_load_paths += Dir["#{config.root}/controllers/concerns/**/"]

    config.eager_load_paths << Rails.root.join('lib/**')
    config.eager_load_paths += Dir["#{config.root}/lib/**/"]

    config.eager_load_paths << Rails.root.join('services/**')
    config.eager_load_paths += Dir["#{config.root}/services/**/"]

    config.eager_load_paths << Rails.root.join('services_bin/**')
    config.eager_load_paths += Dir["#{config.root}/services_bin/**/"]



    # config.assets.paths << Rails.root.join("app", "assets", "fonts")
    # config.autoload_paths += %W(#{config.root}/controllers/concerns)
    #
    # ## TRIAL BELOW.
    # config.eager_load_paths << Rails.root.join('lib/**')
    # config.eager_load_paths += Dir["#{config.root}/lib/**/"]
    #
    #
    #
    # config.autoload_paths << File.join(config.root, "lib")
    # config.autoload_paths += %W(#{config.root}/controllers/concerns)
    # # config.autoload_paths += %W(#{config.root}/lib/servicers)
    # config.autoload_paths << Rails.root.join('lib/servicers')
    # config.autoload_paths += Dir["#{config.root}/lib/servicers"]



  end
end
