require 'rails_helper'

RSpec.configure do |c|
  c.use_transactional_examples = false
  c.order = 'defined'
end

RSpec.describe Following, type: :model do
  it 'is valid with a follower_id and a followed_id' do
    user1 = User.create(username: 'janet', fullname: 'Janet John')
    user2 = User.create(username: 'joseph', fullname: 'Joseph Tickery')
    following = Following.create(follower_id: user2.id, followed_id: user1.id)
    expect(following).to be_valid
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
    expect(current_path).to eql(root_path)
    expect(page).not_to have_content 'user2'
  end
end