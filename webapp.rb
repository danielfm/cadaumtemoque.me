require 'sinatra'

get '/' do
  redirect '/rece', 302
end

get '/rece' do
  erb :index
end
