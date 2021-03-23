require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a username and a fullname' do
    user = User.create(username: 'janet', fullname: 'Janet John')
    expect(user).to be_valid
  end
end

RSpec.feature 'Users' do
  before(:each) do
    @user = User.create(username: 'user1', fullname: 'User1')
    @user = User.create(username: 'user2', fullname: 'User2')
  end

  scenario 'user1 sends friendship request and user2 accepts the request' do
    visit root_path
    click_on 'Sign in'
    fill_in 'Username', with: 'user1'
    click_on 'Sign in'
    click_on 'Home'
    expect(current_path).to eql(root_path)
    click_on 'Follow'
    click_on 'All users'
    first(:button, 'Request Friendship').click
    # click_on 'Request Friendship'
    expect(page).to have_current_path('/users/1')
    expect(page).to have_content 'user2'
    click_on 'Sign out'

    fill_in 'Email', with: 'user2@mail.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    expect(current_path).to eql(root_path)
    click_on 'All users'
    page.find_by_id(2).click
    click_on 'Accept'
    expect(page).to have_current_path('/users/2')
    expect(page).to have_content 'user1'
  end
end
