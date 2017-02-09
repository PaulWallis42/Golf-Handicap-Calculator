class User
  include DataMapper::Resource

  property :id,       Serial
  property :email,    String
  property :password, String
  property :handicap, Integer

  has n, :rounds

end
