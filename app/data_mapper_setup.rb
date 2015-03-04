env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/joe_app_#{env}")

DataMapper.finalize

DataMapper.auto_upgrade!