feature 'users profile page' do
  context 'user has signed in and entred rounds and holes' do
    scenario 'user visits profile page which displays stats', js: true do
      sign_up
      record_round
      record_holes
      click_link('Profile Page')
      expect(current_path).to eq('/users/1')
      expect(page).to have_content('First User Profile Page')
      expect(page).to have_content('Current Handicap: 25')
      expect(page).to have_content('28')
      expect(page).to have_content('44')
    end
  end
end
