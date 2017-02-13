ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'


class GolfTracker < Sinatra::Base
  get '/' do
    erb :'index'
  end

  post '/user' do

  end

  post '/round' do

  end

  post '/hole' do
    
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
