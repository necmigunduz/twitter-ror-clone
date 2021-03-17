require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a username and a fullname' do
    user = User.create(username: 'janet', fullname: 'Janet John')
    expect(user).to be_valid
  end
end
