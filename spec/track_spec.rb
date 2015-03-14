require 'spec_helper' do
	
	describe Track do

		let(:track) { Track.new("At Your Touch") }		

		it 'should save and retrieve tracks from the database' do
			expect(track.count).to eq(1)
			track = track.first
			expect(track.title).to eq('At Your Touch')
			track.destroy
			expect(track.count).to eq(0)
		end
	end
end