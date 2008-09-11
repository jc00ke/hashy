require 'rubygems'
require 'sinatra'
require 'digest'
require 'singleton'

class Hashy
	include Singleton

	def initialize
		@values = {}
	end

	def self.get_hashes(text)		
		if @values.has_key?(text)
			@values[text]
		else
			md5 = Digest::MD5.hexdigest(text)
			sha1 = Digest::SHA1.hexdigest(text)
			sha2 = Digest::SHA256.hexdigest(text)
			body = "
				$('md5').value = '#{md5}';
				$('sha1').value = '#{sha1}';
				$('sha2').value = '#{sha2}';
			"
			@values[text] = body
		end
	end
end
	


get '/' do
	erb :index
end

get '/h/:text' do
	text = params[:text]
	header 'Content-Type' => 'text/javascript'
	hashy = Hashy.new
	hashy.get_hashes('ha$hy')
end
