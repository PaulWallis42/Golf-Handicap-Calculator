ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'rack-flash'
require 'bcrypt'
require './app/lib/handicap'

class GolfTracker < Sinatra::Base
  enable :sessions
  use Rack::Flash

  get '/' do
    @user = User.first(email: session[:email])
    erb :'index'
  end

  get '/users/sign_up' do
    erb :'sign_up'
  end

  post '/users/sign_up' do
    user = User.make_new(params)
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
    if User.authenticate(params)
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
    Round.round_create(session, params)
    user = User.first(email: session[:email])
    handicap = Handicap.calculate(user)
    handicap <= 28 ? user.handicap = handicap : user.handicap = 28
    user.save
    redirect '/holes/new'
  end

  get '/holes/new' do
    erb :'add_holes'
  end

  post '/holes' do
    Hole.hole_create(session, params)
    redirect '/holes/new'
  end

  get '/users/:id' do
    @user = User.first(email: session[:email])
    erb :'users_profile'
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
