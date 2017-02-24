ENV['RACK_ENV'] ||= 'development'

require_relative 'control_helper'

class GolfTracker < Sinatra::Base
  enable :sessions
  use Rack::Flash

  get '/' do
    @user = User.first(email: session[:email])
    rounds = Round.all
    sameday_rounds = rounds.group_by { |round| round.date }
    if sameday_rounds.any? { |date, round| round.length > 1 }
      @players = Competition.players(rounds)
      @winners = ControlHelper.competition_winners(rounds)
    end
    erb :'index'
  end

  get '/users/sign_up' do
    erb :'sign_up'
  end

  post '/users/sign_up' do
    user = User.make_new(params)
    if user.save
      session[:email] = params[:email]
      @user = User.first(email: params[:email])
      flash[:welcome] = "Welcome to Golf Tracker #{@user.name}"
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
      @user = User.first(email: params[:email])
      flash[:welcome] = "Welcome to Golf Tracker #{@user.name}"
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
    @user = User.first(email: session[:email])
    erb :'add_round'
  end

  post '/round' do
    Round.round_create(session, params)
    user = User.first(email: session[:email])
    handicap = Handicap.calculate(user)
    handicap <= 28 ? user.handicap = handicap : user.handicap = 28
    user.save
    redirect '/holes/new/1'
  end

  get '/holes/new/:id' do
    @user = User.first(email: session[:email])
    @course_hole = OakPark.first(hole_number: params[:id])
    erb :'add_holes'
  end

  post '/holes' do
    Hole.hole_create(session, params)
    hole_num = params[:number].to_i + 1
    if hole_num <= 18
      redirect "/holes/new/#{hole_num}"
    else
      round = Round.last
      stableford = Stableford.calculate(round)
      round.stableford = stableford
      round.save
      flash[:holes] = "Round entered successfully"
      redirect "/"
    end
  end

  get '/users/:id' do
    @user = User.first(email: session[:email])
    @rounds = @user.rounds.all
    erb :'users_profile'
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
