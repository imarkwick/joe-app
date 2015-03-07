require 'spec_helper' do
	
	describe Track do

		it 'should save and retrieve tracks from the database' do
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