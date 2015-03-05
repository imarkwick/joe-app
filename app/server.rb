require 'sinatra'
require 'data_mapper'
require 'aws/s3'
require_relative 'models/track'
require_relative 'data_mapper_setup'

set :public_dir, Proc.new { File.join(root, "..", "public") }

get '/' do 
	@tracks = Track.all
	erb :index
end

post '/' do
	title = params["title"]
	Track.create(:title => title)
	redirect to('/')
end

get '/artist' do
	erb :artist
end
