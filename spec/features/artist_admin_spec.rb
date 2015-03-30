# require 'spec_helper'

# feature 'Joe signs in' do 

# 	scenario 'when trying to make a login' do
# 		expect{ sign_up }.to change(User, :count).by(1)
# 		expect(page).to have_content('Hey Joe Man')
# 		expect(User.first.email).to eq('joe@example.com')
# 	end

# 	def sign_up(name = "Joe",
# 							email = "joe@example.com",
# 							password = "orange")
# 		visit '/new_artist'
# 		fill_in :name, 	:with => name
# 		fill_in :email, :with => email
# 		fill_in :password, :with => password
# 		click_button 'Create Login'
# 	end
# end