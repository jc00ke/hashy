require 'rubygems'
require 'sinatra'
require 'digest'
require 'singleton'

class Hashy
	include Singleton

	def initialize
		@values = {}
	end

	def get_hashes(text)
		response = ''
		if @values.has_key?(text)
			response = @values[text]
		else
			md5 = Digest::MD5.hexdigest(text)
			sha1 = Digest::SHA1.hexdigest(text)
			sha2 = Digest::SHA256.hexdigest(text)
			body = "
				$('md5').value = '#{md5}';
				$('sha1').value = '#{sha1}';
				$('sha2').value = '#{sha2}';
			"
			response = @values[text] = body
		end
		response
	end
end
	


get '/' do
	erb :index
end

get '/h/:text' do
	header 'Content-Type' => 'text/javascript'
	hashy = Hashy.instance
	hashy.get_hashes(params[:text])
end
