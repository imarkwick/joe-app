get '/artist' do
	@tracks = Track.all
	@gigs = Gig.all
	erb :artist
end

get '/artist/:id' do
	remove_track = Track.get(params[:id])
	track_title = Track.get(params[:title])
	if remove_track.destroy
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
