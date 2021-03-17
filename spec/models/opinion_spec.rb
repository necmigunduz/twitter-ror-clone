require 'rails_helper'

RSpec.describe Opinion, type: :model do
  it 'is valid with a username and a fullname' do
    user = User.create(username: 'janet', fullname: 'Janet John')
    opinion = user.opinions.build(text: 'This is the first text!')
    expect(opinion).to be_valid
  end
end
