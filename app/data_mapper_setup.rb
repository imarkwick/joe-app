env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://localhost/joe_app_development')

DataMapper.finalize

DataMapper.auto_upgrade!