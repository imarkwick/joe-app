get '/artist_edit/:id' do
	@track = Track.get(params[:id])
	erb :artist_edit
end