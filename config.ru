require 'bundler'
require 'json'

Bundler.require

map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'assets'
  run environment
end

require './main.rb'
run App
