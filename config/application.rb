require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module PetFinderBackend
  class Application < Rails::Application
    config.load_defaults 6.0
    config.generators.system_tests = nil
    config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
    config.autoload_paths += Dir[Rails.root.join('app', 'api', '*')]
  end
end
