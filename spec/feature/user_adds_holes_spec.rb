feature 'user can add holes' do

  scenario 'after adding a round a user can add holes', js: true do
    sign_up
    record_round
    record_holes
    hole = Hole.first
    expect(hole.par).to eq(4)
    expect(hole.number).to eq(1)
    expect(hole.distance).to eq(405)
    expect(hole.si).to eq(4)
    expect(hole.shots).to eq(5)
    expect(hole.putts).to eq(2)
    expect(Hole.all.length).to eq(18)
  end

  scenario 'can not add holes if fields left empty', js: true do
    sign_up
    record_round
    select('Hole: 3 - Par: 3 - Distance: 157 - SI: 12', from: 'score-card-select')
    click_button('Submit')
    expect(accept_alert).to eq("Shots can't be left blank")
    expect(Hole.all.length).to eq(0)
  end

end
