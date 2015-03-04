require 'spec_helper'

describe Track do 

	context 'checking datamapper is working' do
		it 'should be created and retrieved from the db' do
			expect(Track.count).to eq(0)
			Track.create(title: 'At Your Touch')
			expect(Track.count).to eq(1)
			track = Track.first
			expect(track.title).to eq('At Your Touch')
			track.destroy
			expect(Track.count).to eq(0)
		end
	end

end