feature 'Signing up' do

  scenario 'user can sign up' do
    visit('/')
    fill_in 'email', with: 'golfer@handicap.com'
    fill_in 'password', with: 'password'
    fill_in 'name', with: 'Nicholas'
    click_button 'Submit'
    user = User.first
    expect(user.email).to eq('golfer@handicap.com')
    expect(user.name).to eq('Nicholas')
  end

end
