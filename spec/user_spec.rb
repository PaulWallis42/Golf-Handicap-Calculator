describe User do

  it 'can save a new user to the database' do
    User.create(email: 'nick.faldo@sawgrass.com', password: 'golfer', handicap: 0)
    user = User.first
    expect(user.email).to eq('nick.faldo@sawgrass.com')
    expect(user.password).to eq('golfer')
    expect(user.handicap).to eq(0)
  end

end
