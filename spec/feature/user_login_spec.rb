feature 'Signing up' do

  scenario 'user can sign up' do
    visit('/')
    click_link('Sign up')
    fill_in 'email', with: 'golfer@handicap.com'
    fill_in 'password', with: 'password'
    fill_in 'name', with: 'Nicholas'
    click_button 'Submit'
    user = User.first(email: 'golfer@handicap.com')
    expect(user.email).to eq('golfer@handicap.com')
    expect(user.name).to eq('Nicholas')
    expect(current_path).to eq('/')
  end

  scenario 'user can only sign up with unique email' do
    sign_up
    visit('/')
    click_link('Sign up')
    fill_in 'email', with: 'first_user@email.com'
    fill_in 'password', with: 'password'
    fill_in 'name', with: 'First User'
    click_button 'Submit'
    expect(page).to have_content('Email is already taken')
    expect(current_path).to eq('/sign_up')
  end

  scenario 'user can sign in with correct details' do
    sign_up
    visit('/')
    click_link('Sign in')
    fill_in 'email', with: 'first_user@email.com'
    fill_in 'password', with: 'password'
    click_button 'Submit'
    expect(page).to have_content('Welcome to golf tracker first_user@email.com')
    expect(current_path).to eq('/')
  end

  scenario 'user can not sign in with incorrect details' do
    visit('/')
    click_link('Sign in')
    fill_in 'email', with: 'first_user@email.com'
    fill_in 'password', with: 'incorrect_password'
    click_button 'Submit'
    expect(page).to have_content('Either your email and/or password are incorrect')
    expect(current_path).to eq('/sign_in')
  end

end
