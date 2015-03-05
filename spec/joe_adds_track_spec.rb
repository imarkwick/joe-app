require 'spec_helper'

feature 'Joe adds a new track' do
	scenario 'when opening his personal landing page' do
		expect(Track.count).to eq(0)
		visit '/artist'
		add_track('At Your Touch')
		expect(Track.count).to eq(1)
		track = Track.first
		expect(track.title).to eq('At Your Touch')
	end

	def add_track(title)
		within('#new-track') do
			fill_in 'title', :with => title
			click_button 'Add Track'
		end
	end
end	