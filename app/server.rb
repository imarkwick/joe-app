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

def bucket_list
	s3_connect
	AWS::S3::Service.buckets.each do |bucket|
		puts "#{bucket.name}\t#{bucket.creation_date}"
	end
end

def all_track_names
	s3_connect
	@my_bucket = AWS::S3::Bucket.find('yo-man')
	all_tracks = @my_bucket.objects
	@track_keys = all_tracks.map{ |x| x.key }
end

get '/' do 
	s3_connect
	@tracks = Track.all	
	@my_bucket = AWS::S3::Bucket.find('yo-man')
	all_track_names
	erb :index
end

post '/' do
	bucket = 'yo-man'
	title = params["title"]
	filename = params["tune"][:filename]
	tune = params["tune"][:tempfile]
	Track.create(:title => title, :tune => tune)
	# File.open('./public/'+title, 'wb') do |f|
	# 	f.write(tune.read)
	# end
	s3_connect
	AWS::S3::S3Object.store(
        title,
        tune,
        'yo-man',
        :content_type => 'audio/m4a'
	)
	redirect '/'
end

require_relative 'controllers/artist'
require_relative 'controllers/gigs'