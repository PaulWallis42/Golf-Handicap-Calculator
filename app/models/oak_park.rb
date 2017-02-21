class OakPark
  include DataMapper::Resource

  property :hole_number,    Integer, key: true
  property :hole_par,       Integer
  property :hole_si,        Integer
  property :hole_distance,  Integer

end
