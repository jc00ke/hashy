require 'rubygems'
require 'sinatra'
require 'digest'
#require 'digest/md5'
#require 'digest/sha2'

get '/' do
	erb :index
end

get '/h/:text' do
	text = params[:text]
	header 'Content-Type' => 'text/javascript'
	md5 = Digest::MD5.hexdigest(text)
	sha1 = Digest::SHA1.hexdigest(text)
	sha2 = Digest::SHA256.hexdigest(text)
	body = "
		$('md5').value = '#{md5}';
		$('sha1').value = '#{sha1}';
		$('sha2').value = '#{sha2}';
	"
end
