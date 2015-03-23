get '/gigs' do
	@gigs = Gig.all
	puts @gigs
	@gigs.each do |gig|
		gig.destroy if Date.parse(gig.date) < Date.today
	end

	dates_in_order = sort_by_date(@gigs)
	@gigs.each do |gig|
		if gig.date == dates_in_order[0]
			puts gig
			@gigs.unshift(@gigs.delete_at(@gigs.index(gig)))
		end
	end
	puts @gigs

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