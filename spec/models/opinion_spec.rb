require 'rails_helper'

RSpec.configure do |c|
  c.use_transactional_examples = false
  c.order = 'defined'
end

RSpec.describe Opinion, type: :model do
  it 'is valid with a username and a fullname' do
    user = User.create(username: 'janet', fullname: 'Janet John')
    opinion = user.opinions.build(text: 'This is the first text!')
    expect(opinion).to be_valid
  end
end

RSpec.feature 'Users' do
  before(:each) do
    @user = User.create(username: 'user1', fullname: 'User1')
  end

  scenario 'user1 sends friendship request and user2 accepts the request' do
    
    visit root_path
    click_on 'Sign in'
    fill_in 'Username', with: 'user1'
    click_on 'Sign in'
    fill_in 'opinion_text', with: 'This is my first opinion!'
    sleep(5)
    click_on 'Submit'
    expect(page).to have_content 'This is my first opinion!'
  end
end
