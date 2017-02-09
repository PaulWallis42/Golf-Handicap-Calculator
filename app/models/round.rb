class Round
  include DataMapper::Resource

  property :id,     Serial
  property :date,   Date
  property :course, String
  property :score,  Integer
  
end
