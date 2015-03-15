require 'sinatra'
require 'data_mapper'
require 'aws/s3'
require_relative 'models/track'
require_relative 'models/gig'
require_relative 'data_mapper_setup'
require_relative 'helper_methods/helper.rb'

enable :sessions
set :session_secret, 'super secret'
set :public_dir, Proc.new { File.join(root, "..", "public") }

require_relative 'controllers/index'
require_relative 'controllers/artist'
require_relative 'controllers/gigs'