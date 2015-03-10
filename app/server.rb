require 'sinatra'
require 'data_mapper'
require 'aws/s3'
require_relative 'models/track'
require_relative 'models/gig'
require_relative 'data_mapper_setup'

set :public_dir, Proc.new { File.join(root, "..", "public") }

get '/' do 
	@tracks = Track.all
	erb :index
end

post '/' do
	title = params["title"]
	Track.create(:title => title)
	redirect '/'
end

get '/artist' do
	erb :artist
end

get '/gigs' do
	@gigs = Gig.all
	erb :gigs
end

post '/gigs' do
	date = params["date"]
	venue = params["venue"]
	Gig.create(:date => date, :venue => venue)
	redirect to('/gigs')
end
