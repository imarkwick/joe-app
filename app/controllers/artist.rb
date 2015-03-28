get '/artist' do
	@tracks = Track.all
	@gigs = Gig.all
	@gigs.each do |gig|
		gig.destroy if Date.parse(gig.date) < Date.today
	end
	erb :artist
end

get '/artist/:id' do
	remove_track = Track.get(params[:id])
	track_title = remove_track.title
	bucket = 'yo-man'
	aws_file = find_aws_file(track_title)
	s3_connect
	remove_track.destroy
	if AWS::S3::S3Object.exists? track_title, bucket
		AWS::S3::S3Object.delete(track_title, bucket)
		flash[:notice] = "Track deleted"
	end
	redirect '/artist'
end

get '/artist/gig/:id' do
	remove_gig = Gig.get(params[:id])
	if remove_gig.destroy
		flash[:notice] = "Gig deleted"
	end
	redirect '/artist'
end
