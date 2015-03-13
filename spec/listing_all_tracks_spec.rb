require 'spec_helper'

feature 'User opens the app to see tracks listed' do
	
	before(:each) {
		Track.create(	:title => "Badu",
									:tune => "spec/Badu.m4a"
		)
	}

	scenario 'on the landing page there is an artist name' do
		visit '/'
		expect(page).to have_content('Joe Hertz')
	end

	scenario 'there is a list of tracks' do
		visit '/'
		expect(page).to have_content('Badu')
	end
end