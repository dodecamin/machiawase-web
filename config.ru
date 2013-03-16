require 'bundler'
require 'json'

configure :production do
  require 'newrelic_rpm'
end

Bundler.require

map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'assets'
  run environment
end

require './main.rb'
run App
