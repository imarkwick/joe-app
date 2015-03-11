require 'sinatra'
require 'data_mapper'
require 'aws/s3'
require_relative 'models/track'
require_relative 'models/gig'
require_relative 'data_mapper_setup'

set :public_dir, Proc.new { File.join(root, "..", "public") }

def s3_connect
	AWS::S3::Base.establish_connection!(
		:access_key_id => ENV['JOE_AWS_KEY_ID'],
		:secret_access_key => ENV['JOE_AWS_KEY_SECRET']
	)
end

get '/' do 
	@tracks = Track.all
	erb :index
end

def bucket_list
	s3_connect
	AWS::S3::Service.buckets.each do |bucket|
		puts "#{bucket.name}\t#{bucket.creation_date}"
	end
end

post '/' do
	bucket = 'yo-man'
	track_name = params["title"]
	title = params["tune"][:filename]
	tune = params["tune"][:tempfile]
	Track.create(:title => title, :tune => tune)
	File.open('./public/'+title, 'wb') do |f|
		f.write(tune.read)
	end
	s3_connect
	AWS::S3::S3Object.store(
        title,
        tune,
        'yo-man',
        :content_type => 'audio/m4a'
	)	
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
