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

  def self.hole_create(session, params)
    user = User.first(email: session[:email])
    round = Round.last(user_id: user.id)
    round.holes.create( number: params[:number],
                        par: params[:par],
                        si: params[:si],
                        distance: params[:distance],
                        shots: params[:shots],
                        putts: params[:putts] )
  end

end
