require 'spec_helper'

feature 'Joe signs in' do 

	scenario 'when trying to make a login' do
		expect{ sign_up }.to change(User, :count).by(1)
		expect(page).to have_content('Hey Joe Man')
		expect(User.first.email).to eq('joe@example.com')
	end

	scenario 'with a password that doesn\'t match' do
		expect{ sign_up('name','a@a.com','pass','wrong') }.to change(User, :count).by(0)
	end

	def sign_up(name = "Joe",
							email = "joe@example.com",
							password = "orange",
							password_confirmation = "orange")
		visit '/new_artist'
		fill_in :name, 	:with => name
		fill_in :email, :with => email
		fill_in :password, :with => password
		fill_in :password_confirmation, :with => password_confirmation
		click_button 'Create Login'
	end
end