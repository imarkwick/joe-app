get '/artist' do
	@tracks = Track.all
	@gigs = Gig.all
	erb :artist
end

get '/artist/:id' do
	remove_track = Track.get(params[:id])
	remove_track.destroy
	redirect '/artist'
end

get '/artist/gig/:id' do
	remove_gig = Gig.get(params[:id])
	remove_gig.destroy
	redirect '/artist'
end
