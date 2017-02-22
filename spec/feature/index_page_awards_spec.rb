feature 'awards acheived' do
  context 'when more than 1 player has played the same round' do

    before(:each) do
      sign_up
      record_round
      record_holes
      click_link 'Sign out'
      second_user_sign_up
      second_user_record_round
      second_user_record_holes
    end

    scenario 'the winner of the stroke score is displayed on home page' do
      expect(page).to have_content('Results of Oak Park on 14/02/2017')
      expect(page).to have_content('Stroke Play winner: Second User with score of 72')
    end
  end
end
