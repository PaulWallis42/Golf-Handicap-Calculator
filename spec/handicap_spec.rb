describe Handicap do

  it 'calculates a golfers handicap from total rounds score to date' do
    user = double('user')
    allow(user).to receive_message_chain(:rounds, :all) { [90, 95, 100, 105] }
    expect(Handicap.calculate(user)).to eq(27)
  end

end
