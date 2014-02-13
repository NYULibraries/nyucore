$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)
require 'coveralls'
Coveralls.wear!
require 'rspec'
require 'nyulibraries-nyucore'
require 'pry'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
