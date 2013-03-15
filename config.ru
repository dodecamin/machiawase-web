require 'bundler'
require 'json'
require 'newrelic_rpm'

Bundler.require

map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'assets'
  run environment
end

require './main.rb'
run App
