require 'bcrypt'

class User
  DEFAULT_HANDICAP = 28
  include DataMapper::Resource

  property :id,       Serial
  property :email,    String,   unique: true
  property :password, String,   length: 100
  property :name,     String
  property :handicap, Integer

  has n, :rounds

  def self.make_new(params)
    hashed_password = BCrypt::Password.create(params[:password])
    User.new( email: params[:email],
              name: params[:name],
              password: hashed_password,
              handicap: DEFAULT_HANDICAP )
  end

  def self.authenticate(params)
    user = User.first(email: params[:email])
    user && BCrypt::Password.new(user.password) == params[:password]
  end

end
