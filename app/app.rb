ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'


class GolfTracker < Sinatra::Base
  enable :sessions

  get '/' do
    erb :'index'
  end

  post '/sign_up' do
    User.create(email: params[:email],
                name: params[:name],
                password: params[:password])
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
