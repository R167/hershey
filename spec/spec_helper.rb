require 'bundler/setup'
Bundler.setup

require 'hershey' # and any other gems you need

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :should
  end
end