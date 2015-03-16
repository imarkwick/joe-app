def s3_connect
	AWS::S3::Base.establish_connection!(
		:access_key_id => ENV['JOE_AWS_KEY_ID'],
		:secret_access_key => ENV['JOE_AWS_KEY_SECRET']
	)
end

def all_track_names
	s3_connect
	@my_bucket = AWS::S3::Bucket.find('yo-man')
	all_tracks = @my_bucket.objects
	@track_keys = all_tracks.map{ |x| x.key }
end

def bucket_list
	s3_connect
	AWS::S3::Service.buckets.each do |bucket|
		puts "#{bucket.name}\t#{bucket.creation_date}"
	end
end

def save_file_to_public
	File.open('./public/'+title, 'wb') do |f|
		f.write(tune.read)
	end
end

def psql_track_names
	tracks = Track.all
	track_titles = [] 
	tracks.each do |track|
		track_titles << track.title
	end
	return track_titles
end

def select_aws_file(title)
	track_title = all_track_names.select { |track| track == title }
	track_title.join("")
end