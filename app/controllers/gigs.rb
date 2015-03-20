get '/gigs' do
	@gigs = Gig.all
	@gigs.each do |gig|
		gig.destroy if Date.parse(gig.date) < Date.today
	end
	erb :gigs
end

post '/gigs' do
	date = params["date"]
	date_object = Date.parse(date)
	newdate = date_object.strftime('%d-%m-%Y')
	venue = params["venue"]
	url = params["url"]
	Gig.create(	:date => newdate, 
							:venue => venue, 
							:url => url
						)
	redirect to('/gigs')
end