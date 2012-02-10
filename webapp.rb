# -*- coding: utf-8 -*-

require 'sinatra'
require 'sinatra/mongo'

# Environments

configure :development do
  set :mongo, 'mongodb://localhost:27017/cadaum'
end

configure :production do
  set :mongo, ENV["MONGOHQ_URI"]
end

# Helpers

helpers do
  include Rack::Utils

  def random?
    params[:oq] == "lol"
  end

  def random
    return unless random?

    oq = mongo["oq"]
    oq.find_one({}, {skip: rand(oq.count)})["txt"]
  end

  def oq
    escape_html random || (params[:oq] ? params[:oq] : "o")
  end
end

# Views

get '/' do
  redirect '/rece', 302
end

get '/rece' do
  erb :index
end
