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

def stream_file
	s3_connect
	File.open('@my_bucket', 'wb') do |file|
		large_object.read do |chunk|
			file.write(chunk)
		end
	end
end

get '/' do 
	s3_connect
	@tracks = Track.all	
	@my_bucket = AWS::S3::Bucket.find('yo-man')
	
	@my_bucket.each do |object|
		puts "#{object.key}\t#{object.about['content-length']}\t#{object.about['last-modified']}"
	end

	# stream_file

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

require_relative 'controllers/artist'
require_relative 'controllers/gigs'
