class Round
  include DataMapper::Resource

  property :id,       Serial
  property :date,     Date
  property :course,   String
  property :score,    Integer
  property :handicap, Integer

  has n, :holes
  belongs_to :user

  def self.round_create(session, params)
    user = User.first(email: session[:email])
    user.rounds.create( date: params[:date],
                        course: params[:course],
                        score: params[:score],
                        handicap: user.handicap)
  end

end
