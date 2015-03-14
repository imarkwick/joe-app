class Gig

	include DataMapper::Resource

	property :id,			Serial
	property :venue,	String
	property :date,		String
	property :url,		String

end