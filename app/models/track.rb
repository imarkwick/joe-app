class Track

	include DataMapper::Resource

	property :id,			Serial
	property :title,	String
	property :tune,		String

end