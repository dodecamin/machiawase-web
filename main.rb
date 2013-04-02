# -*- coding: utf-8 -*-
require 'kconv'

Slim::Engine.set_default_options :pretty => true

class App < Sinatra::Base
  register Padrino::Sprockets
  sprockets

  configure :development do
    Bundler.require :development
    register Sinatra::Reloader
  end

  configure :production do
    require 'newrelic_rpm'
  end

  get '/' do
    slim :index
  end

  before '/rendezvous*' do
    @m = Machiawase.where(*URI.decode(request.query_string).toutf8.split(','))
  end

  get '/rendezvous.json' do
    @m.to_json
  end

  get '/rendezvous.msgpack' do
    @m.to_msgpack
  end

  post '/rendezvous' do
    redirect to(URI.encode("/rendezvous?#{params[:text]},#{params[:text2]}"))
  end

  get '/rendezvous' do
    slim :result
  end
end
