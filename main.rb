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
    g1 = Machiawase::Place.geocode(params[:text])
    p1 = Machiawase::Place.new(g1["lat"], g1["lon"])
    g2 = Machiawase::Place.geocode(params[:text2])
    p2 = Machiawase::Place.new(g2["lat"], g2["lon"])
    m = Machiawase.new(p1, p2)
    @j = JSON.parse(m.to_json)
    slim :result
  end
end
