get '/artist_edit/:id' do
	@track = Track.get(params[:id])
	erb :artist_edit
end

post '/artist_edit/:id' do
	altered_track = Track.get(params[:id])
end