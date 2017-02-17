ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'


class GolfTracker < Sinatra::Base
  enable :sessions

  get '/' do
    erb :'index'
  end

  get '/sign_up' do
    erb :'sign_up'
  end



  post '/sign_up' do
    user = User.new(email: params[:email],
                    name: params[:name],
                    password: params[:password])
    if user.save
      session[:name] = params[:name]
      redirect '/'
    else
      session[:error] = 'Email is already taken'
      redirect '/sign_up'
    end
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
