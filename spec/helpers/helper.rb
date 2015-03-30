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

def sign_up(name = "Joe",
						email = "joe@example.com",
						password = "orange",
						password_confirmation = "orange")
	within('#sign-up') do
		fill_in :name, 	:with => name
		fill_in :email, :with => email
		fill_in :password, :with => password
		fill_in :password_confirmation, :with => password_confirmation
		click_button 'Create Login'
	end
end
