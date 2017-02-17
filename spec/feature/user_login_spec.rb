feature 'Signing up' do

  before(:each) do
    User.create(email: 'first_user@email.com',
                name: 'First User',
                password: 'password')
  end

  scenario 'user can sign up' do
    visit('/')
    click_link('Sign up')
    fill_in 'email', with: 'golfer@handicap.com'
    fill_in 'password', with: 'password'
    fill_in 'name', with: 'Nicholas'
    click_button 'Submit'
    user = User.get(2)
    expect(user.email).to eq('golfer@handicap.com')
    expect(user.name).to eq('Nicholas')
  end

  scenario 'user can only sign up with unique password' do
    visit('/')
    click_link('Sign up')
    fill_in 'email', with: 'first_user@email.com'
    fill_in 'password', with: 'password'
    fill_in 'name', with: 'First User'
    click_button 'Submit'
    expect(page).to have_content('Email is already taken')
  end

end
