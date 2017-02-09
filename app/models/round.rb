class Round
  include DataMapper::Resource

  property :id,     Serial
  property :date,   Date
  property :course, String
  property :score,  Integer

  has n, :holes
  belongs_to :user

end
