feature 'once signed in' do

  scenario 'user can add a round of golf' do
    sign_up
    record_round
    round = Round.first
    expect(round.course).to eq('Oak Park')
    expect(round.date.to_s).to eq('2017-02-14')
    expect(round.score).to eq(95)
  end

  scenario 'can not add a round without date and score', js: true do
    sign_up
    click_link('Add a round')
    click_button('Submit')
    expect(Round.all.length).to eq(0)
    expect(accept_alert).to eq("Date and Score can't be blank")
  end

end
