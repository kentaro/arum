ENV["RAILS_ENV"] = "test"

require File.expand_path('../test_app/config/environment', __FILE__)

require 'rspec/rails'

RSpec.configure do |config|
  config.include Capybara::DSL, type: :request
end
