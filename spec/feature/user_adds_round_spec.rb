feature 'once signed in' do

  scenario 'user can add a round of golf' do
    sign_up
    click_link 'Add a round'
    select('Oak Park', from: 'course')
    fill_in('date', with: '14/02/2017')
    fill_in('score', with: 95)
    click_button 'Submit'
    round = Round.first
    expect(round.course).to eq('Oak Park')
    expect(round.date.to_s).to eq('2017-02-14')
    expect(round.score).to eq(95)
  end

end
