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

def save_file_to_public
	File.open('./public/'+title, 'wb') do |f|
		f.write(tune.read)
	end
end

def save_file_to_aws(title, file)
	s3_connect
	AWS::S3::S3Object.store(
	      title,
	      file,
	      'yo-man',
	      :content_type => 'audio/m4a'
	)
end

def psql_track_names
	tracks = Track.all
	track_titles = [] 
	tracks.each do |track|
		track_titles << track.title
	end
	return track_titles
end

def find_aws_file(title)
	s3_connect
	track = AWS::S3::S3Object.find(title, 'yo-man')
	return track
end

def sort_by_date(array)
	dates_array = []
	array.each do |gig|
		dates_array << gig.date
	end
	dates_array.sort_by{ |d| d,m,y=d.split("-");[y,m,d] }
end

def all_gig_dates(array)
	gig_dates = []
	array.each do |gig|
		gig_dates << gig.date
	end
	gig_dates
end



