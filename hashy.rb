require 'rubygems'
require 'sinatra'
require 'digest/sha2'

get '/' do
	erb :index
end

get '/do/:type/:text' do
	text = params[:text]
	Digest::SHA256.hexdigest(text)
end
