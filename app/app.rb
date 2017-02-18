ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'rack-flash'
require 'bcrypt'

class GolfTracker < Sinatra::Base
  enable :sessions
  use Rack::Flash

  get '/' do
    erb :'index'
  end

  get '/users/sign_up' do
    erb :'sign_up'
  end

  post '/users/sign_up' do
    hashed_password = BCrypt::Password.create(params[:password])
    user = User.new(email: params[:email],
                    name: params[:name],
                    password: hashed_password)
    if user.save
      session[:email] = params[:email]
      redirect '/'
    else
      flash[:notice] = 'Email is already taken'
      redirect '/users/sign_up'
    end
  end

  get '/users/sign_in' do
    erb :'sign_in'
  end

  post '/users/sign_in' do
    user = User.first(email: params[:email])
    if user && BCrypt::Password.new(user.password) == params[:password]
      session[:email] = params[:email]
      redirect ('/')
    else
      flash[:notice] = 'Either your email and/or password are incorrect'
      redirect('/users/sign_in')
    end
  end

  get '/user/sign_out' do
    session[:email] = nil
    redirect '/'
  end

  get '/round/new' do
    erb :'add_round'
  end

  post '/round' do
    user = User.first(email: session[:email])
    user.rounds.create(date: params[:date], course: params[:course], score: params[:score])
    redirect '/holes/new'
  end

  get '/holes/new' do
    erb :'add_holes'
  end

  post '/holes' do
    puts params
    redirect '/holes/new'
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
