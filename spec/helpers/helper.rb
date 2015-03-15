def add_gig(date, venue, url)
	within('#new-gig') do
		fill_in 'date', :with => date
		fill_in 'venue', :with => venue
		fill_in 'url', :with => url
		click_button 'Add Gig'
	end
end

def add_track(title)
	within('#new-track') do
		fill_in 'title', :with => title
		attach_file('fileToUpload', 'spec/Badu.m4a')
		click_button 'Add Track'
	end
end
