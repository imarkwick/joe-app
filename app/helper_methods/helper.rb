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

def find_aws_file(title)
	s3_connect
	track = AWS::S3::S3Object.find(title, 'yo-man')
	return track
end

def sort_by_date
	dates = Gig.all
	dates_array = []
	dates.each do |gig|
		dates_array << gig.date
	end
	dates_array.sort_by{ |d| d,m,y=d.split("-");[y,m,d] }
end

def all_gig_dates
	gigs = Gig.all
	gig_dates = []
	gigs.each do |gig|
		gig_dates << gig.date
	end
	gig_dates
end



