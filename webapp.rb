require 'sinatra'

helpers do
  include Rack::Utils

  def oq
    text = params[:oq] ? params[:oq] : "o"
    escape_html text
  end
end

get '/' do
  redirect '/rece', 302
end

get '/rece' do
  erb :index
end
