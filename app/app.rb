ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'rack-flash'


class GolfTracker < Sinatra::Base
  enable :sessions
  use Rack::Flash

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
      session[:email] = params[:email]
      redirect '/'
    else
      flash[:notice] = 'Email is already taken'
      redirect '/sign_up'
    end
  end

  get '/sign_in' do
    erb :'sign_in'
  end

  post '/sign_in' do
    user = User.first(email: params[:email])
    if user && user.password == params[:password]
      session[:email] = params[:email]
      redirect ('/')
    else
      flash[:notice] = 'Either your email and/or password are incorrect'
      redirect('/sign_in')
    end
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
