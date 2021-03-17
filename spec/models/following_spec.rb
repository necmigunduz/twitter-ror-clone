require 'rails_helper'

RSpec.describe Following, type: :model do
  it 'is valid with a follower_id and a followed_id' do
    user1 = User.create(username: 'janet', fullname: 'Janet John')
    user2 = User.create(username: 'joseph', fullname: 'Joseph Tickery')
    following = Following.create(follower_id: user2.id, followed_id: user1.id)
    expect(following).to be_valid
  end
end
