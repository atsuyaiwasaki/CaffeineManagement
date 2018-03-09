require_relative 'boot'
#require File.expand_path('../boot',_FILE_)

require 'rails/all'
require 'amazon/ecs'
Bundler.require(:default,Rails.env)
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


module CafeMane
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    # Amazon::Ecs.options ={
    #   #:associate_tag => '',

    # }
     # Amazon::Ecs.configure do |options|
     #   # options[:AWS_access_key_id] = ENV["AWS_ACCESS_KEYID"]
     #   # options[:AWS_secret_key] = ENV["AWS_SECRET_KEY"]
     #   # options[:associate_tag] = ENV["ASSOCIATE_TAG_ID"]
     #
     #   # options[:AWS_access_key_id] = '直打ち'
     #   # options[:AWS_secret_key] = '直打ち'
     #   # options[:associate_tag] =  '直打ち'
     # end
    config.load_defaults 5.1
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
