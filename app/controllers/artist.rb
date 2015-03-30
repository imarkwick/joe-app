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
	s3_connect
	remove_track.destroy
	if AWS::S3::S3Object.exists? track_title, bucket
		AWS::S3::S3Object.delete(track_title, bucket)
		flash[:notice] = "Track deleted"
	else 
		flash[:notice] = "Track was not uploaded properly"
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

get '/artist/edit/gig/:id' do
	@gig = Gig.get(params[:id])
	erb :artist_edit
end

post '/artist/edit/gig/:id' do
	altered_event = Gig.get(params[:id])
	updated_date = params["date"]
	date_object = Date.parse(updated_date)
	new_date = date_object.strftime('%d-%m-%Y')
	new_venue = params["venue"]
	new_url = params["url"]
	if altered_event.update(:date => new_date,
												:venue => new_venue,
												:url => new_url
		)	
		flash[:notice] = "Event updated"
		redirect '/artist'
	else 
		flash[:notice] = "Please make sure all fields are filled out"
		# redirect :artist_edit
	end
end













