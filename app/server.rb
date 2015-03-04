require 'sinatra'
require 'data_mapper'
require 'aws/s3'
require_relative 'models/track'
require_relative 'data_mapper_setup'

set :public, Proc.new { File.join(root, "..", "public") }

get '/' do 
	erb :index
end

get '/artist' do
	erb :artist
end
