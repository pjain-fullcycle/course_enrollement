require 'rails_helper'
require 'rspec/rails'
require 'rspec/core'
require 'factory_girl_rails'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
