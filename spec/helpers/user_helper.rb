def sign_up
  visit('/')
  click_link('Sign up')
  fill_in 'email', with: 'first_user@email.com'
  fill_in 'password', with: 'password'
  fill_in 'name', with: 'First User'
  click_button 'Submit'
end

def record_round
  click_link 'Add a round'
  select('Oak Park', from: 'course')
  fill_in('date', with: '14/02/2017')
  fill_in('score', with: 95)
  click_button 'Submit'
end

def record_high_round
  click_link 'Add a round'
  select('Oak Park', from: 'course')
  fill_in('date', with: '14/02/2017')
  fill_in('score', with: 110)
  click_button 'Submit'
end

def record_holes
  i = 1
  while i < 19 do
    find('#score-card-select').find("option[value='#{i}']").select_option
    fill_in('shots', with: 5)
    fill_in('putts', with: 2)
    click_button('Submit')
    i += 1
  end
end
