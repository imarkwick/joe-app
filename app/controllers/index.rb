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
	# filename = params["tune"][:filename]
	tune = params["tune"][:tempfile]
	Track.create(:title => title, :tune => tune)
	s3_connect
	AWS::S3::S3Object.store(
        title,
        tune,
        'yo-man',
        :content_type => 'audio/m4a'
	)
	redirect '/'
end