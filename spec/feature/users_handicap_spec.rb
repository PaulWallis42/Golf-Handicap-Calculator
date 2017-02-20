feature 'golf handicap can be calculated' do

  scenario 'handicap is added to user', js: true do
    sign_up
    record_round
    user = User.first
    expect(user.handicap).to eq(25)
  end

  scenario 'max handicap is 28', js: true do
    sign_up
    record_high_round
    user = User.first
    expect(user.handicap).to eq(28)
  end
end
