require_relative 'boot'

require 'rails/all'
require 'dotenv-rails'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsBlog
  class Application < Rails::Application
    config.load_defaults 5.1
    config.eager_load_paths << "#{Rails.root}/lib"
    #will let any params be passed to any controller 
    #config.action_controller.permit_all_perameters = true
  end
end
