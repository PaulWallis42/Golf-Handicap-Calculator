require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/user'
require_relative 'models/round'
require_relative 'models/hole'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/golf_project_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
