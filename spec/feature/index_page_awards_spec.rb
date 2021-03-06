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
      expect(page).to have_content('Stroke Play Winner: Second User Round of 72')
    end

    scenario 'the winner of the stableford is displayed on the home page' do
      expect(page).to have_content('Stableford Winner: Second User Score of 62')
    end

    scenario 'if more than one loser in the putts comp then both displayed' do
      expect(page).to have_content('C3PO Loser: First User Second User 18 three putts')
    end

    scenario 'page displays the names of all those who played the round' do
      expect(page).to have_content('Competitors: *** First User *** Second User ***')
    end
  end
end
