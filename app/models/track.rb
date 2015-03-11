class Track

	include DataMapper::Resource
	# extend Dragonfly::Model
	# dragonfly_accessor :tune

	property :id,			Serial
	property :title,	String
	property :tune,		String

end