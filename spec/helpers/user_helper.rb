def sign_up
  visit('/')
  click_link('Sign up')
  fill_in 'email', with: 'first_user@email.com'
  fill_in 'password', with: 'password'
  fill_in 'name', with: 'First User'
  click_button 'Submit'
end
