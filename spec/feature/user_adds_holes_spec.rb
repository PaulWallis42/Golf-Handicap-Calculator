feature 'user can add holes' do

  scenario 'after adding a round a user can add holes', js: true do
    sign_up
    click_link('Add a round')
    fill_in('date', with: '01/02/2003')
    fill_in('score', with: '100')
    click_button('Submit')
    select('Hole: 3 - Par: 3 - Distance: 157 - SI: 12', from: 'score-card-select')
    fill_in('shots', with: 5)
    fill_in('putts', with: 2)
    click_button('Submit')
    hole = Hole.first
    expect(hole.par).to eq(3)
    expect(hole.number).to eq(3)
    expect(hole.distance).to eq(157)
    expect(hole.si).to eq(12)
    expect(hole.shots).to eq(5)
    expect(hole.putts).to eq(2)
  end

  scenario 'can not add holes if fields left empty', js: true do
    sign_up
    click_link('Add a round')
    fill_in('date', with: '01/02/2003')
    fill_in('score', with: '100')
    click_button('Submit')
    select('Hole: 3 - Par: 3 - Distance: 157 - SI: 12', from: 'score-card-select')
    click_button('Submit')
    expect(page).to have_content("Shots can't be left blank")
    expect(Hole.all.length).to eq(0)
  end

end
