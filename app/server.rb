require 'sinatra'
require 'data_mapper'
require 'aws/s3'
require 'dragonfly'
require 'dragonfly/s3_data_store'
require_relative 'models/track'
require_relative 'models/gig'
require_relative 'data_mapper_setup'

set :public_dir, Proc.new { File.join(root, "..", "public") }
app = Dragonfly.app

Dragonfly.app.configure do
	datastore :s3,
		bucket_name: 'joetracks-input',
		access_key_id: ENV['JOE_AWS_KEY_ID'],
		secret_access_key: ENV['JOE_AWS_KEY_SECRET'],
		region: 's3-eu-west-1.amazonaws.com'
end

get '/' do 
	@tracks = Track.all
	erb :index
end

post '/' do
	title = params["tune"][:filename]
	tune = params["tune"][:tempfile]
	Track.create(:title => title, :tune => tune)
	File.open('./public/'+title, 'wb') do |f|
		f.write(tune.read)
	end
	puts tune
	puts title
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
