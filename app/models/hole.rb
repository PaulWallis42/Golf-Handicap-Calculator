class Hole
  include DataMapper::Resource

  property :id,       Serial
  property :number,   Integer
  property :par,      Integer
  property :si,       Integer
  property :distance, Integer
  property :putts,    Integer
  property :shots,    Integer

  belongs_to :round

end
