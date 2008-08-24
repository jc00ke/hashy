require 'rubygems'
require 'sinatra'

get '/' do
	erb :index
end

get '/do/:type/:text' do
	'werd'
end