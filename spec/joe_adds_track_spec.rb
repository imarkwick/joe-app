require 'spec_helper'

feature 'Joe adds a new track' do
	
	# scenario 'when opening his personal admin page' do
	# 	expect(Track.count).to eq(0)
	# 	visit '/artist'
	# 	add_track('Badu')
	# 	expect(Track.count).to eq(1)
	# 	track = Track.first
	# 	expect(track.title).to eq('Badu')
	# end

	def add_track(title)
		within('#new-track') do
			fill_in 'title', :with => title
			attach_file('fileToUpload', 'spec/Badu.m4a')
			click_button 'Add Track'
		end
	end
end