class Track

	include DataMapper::Resource

	property :id,			Serial
	property :title,	String, 	:required => true
	property :tune,		FilePath,	:required => true

end