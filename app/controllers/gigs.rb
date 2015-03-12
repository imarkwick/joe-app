get '/gigs' do
	@gigs = Gig.all
	erb :gigs
end

post '/gigs' do
	date = params["date"]
	venue = params["venue"]
	Gig.create(:date => date, :venue => venue)
	redirect to('/gigs')
end