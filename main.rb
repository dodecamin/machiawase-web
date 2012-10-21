# -*- coding: utf-8 -*-
Slim::Engine.set_default_options :pretty => true

class App < Sinatra::Base
  register Padrino::Sprockets
  sprockets
  
  configure :development do
    Bundler.require :development
    register Sinatra::Reloader
  end

  get '/' do
    slim :index
  end

  get '/hello/:name' do
    "Hello #{params[:name]}"
  end

  post '/' do
    "#{params[:text]} #{params[:text2]}"
    m = Machiawase.new
    @j = JSON.parser.new(m.middle_of(params[:text], params[:text2])).parse()
    slim :result
  end
end
