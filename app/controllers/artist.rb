get '/artist' do
	@tracks = Track.all
	erb :artist
end

get '/artist/:id' do
	remove_track = Track.get(params[:id])
	remove_track.destroy
	redirect '/artist'
end
