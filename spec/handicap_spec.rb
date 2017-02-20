describe Handicap do

  it 'calculates a golfers handicap from total rounds score to date' do
    user = double ('user')
    round_object = double ('round_object')
    round_array = [round_object]
    allow(user).to receive_message_chain(:rounds, :all) { round_array }
    allow(round_object).to receive(:score) {95}
    expect(Handicap.calculate(user)).to eq(25)
  end

end
