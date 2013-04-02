ruby "2.0.0"
source "https://rubygems.org"
gem "sinatra", :require => "sinatra/base"
gem 'padrino-sprockets', :git => "https://github.com/nightsailer/padrino-sprockets.git", :require => "padrino/sprockets"
gem "slim"
gem "sass"
gem "coffee-script"
gem 'machiawase'
gem 'newrelic_rpm'

configure :production do
  require 'newrelic_rpm'
end

group :development do
  gem "sinatra-contrib", :require => "sinatra/reloader"
end
