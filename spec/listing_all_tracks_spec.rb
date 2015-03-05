require 'spec_helper'

feature 'User browses the list of tracks' do
	
	before(:each) {
		Track.create(:title => "Badu")
	}

	scenario 'when opening the landing page' do
		visit '/'
		expect(page).to have_content('Joe Hertz')
	end

end