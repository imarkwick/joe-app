get '/artist' do
	@tracks = Track.all
	erb :artist
end