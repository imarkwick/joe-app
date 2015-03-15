require 'spec_helper'

feature 'Joe add a new gig date' do 

	scenario 'when opening his personal admin page' do
		expect(Gig.count).to eq(0)
		visit '/artist'
		add_gig("15.04.15", "XOYO", "www.xoyo.co.uk")
		expect(Gig.count).to eq(1)
		gig = Gig.first
		expect(gig.date).to eq("15.04.15")
		expect(gig.venue).to eq("XOYO")
	end

	# def add_gig(date, venue, url)
	# 	within('#new-gig') do
	# 		fill_in 'date', :with => date
	# 		fill_in 'venue', :with => venue
	# 		fill_in 'url', :with => url
	# 		click_button 'Add Gig'
	# 	end
	# end
end