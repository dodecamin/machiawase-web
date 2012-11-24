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

  get '/*/*' do
    Machiawase.where(*params[:splat]).to_json
  end

  post '/' do
    "#{params[:text]} #{params[:text2]}"
    @m = Machiawase.where(params[:text], params[:text2])
    slim :result
  end
end
