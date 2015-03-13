get '/artist' do
	@tracks = Track.all
	@track = Track.get(params[:id])
	erb :artist
end
