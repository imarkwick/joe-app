require 'spec_helper' do

	feature Gig do

		scenario 'should save and retrieve gigs from the database' do
			expect(Gig.count).to eq(0)
			Gig.create(venue: 'XOYO', date: '15.04.15')
			expect(Gig.count).to eq(1)
			gig = Gig.first
			expect(gig.venue).to eq('XOYO')
			expect(gig.date).to eq('15.04.15')
			gig.destroy
			expect(Gig.count).to eq(0)
		end
	end
end
