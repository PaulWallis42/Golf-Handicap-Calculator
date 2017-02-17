class User
  include DataMapper::Resource

  property :id,       Serial
  property :email,    String,   unique: true
  property :password, String,   length: 100
  property :name,     String
  property :handicap, Integer

  has n, :rounds

end
