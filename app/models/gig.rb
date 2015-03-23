class Gig

	include DataMapper::Resource

	property :id,			Serial
	property :venue,	String
	property :date,		String
	property :url,		String

	validates_presence_of :venue, :date, :url

end