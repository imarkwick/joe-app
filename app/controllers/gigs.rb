get '/gigs' do
	@gigs = Gig.all
	erb :gigs
end

post '/gigs' do
	date = params["date"]
	venue = params["venue"]
	url = params["url"]
	Gig.create(	:date => date, 
							:venue => venue, 
							:url => url
						)
	redirect to('/gigs')
end