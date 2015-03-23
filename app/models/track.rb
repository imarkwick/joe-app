class Track

	include DataMapper::Resource

	property :id,			Serial
	property :title,	String
	property :tune,		String

	validates_presence_of :title, :tune

end