class User < ApplicationRecord
    validates :username, presence: true, length: { maximum: 10 }
    validates :fullname, presence: true, length: { maximum: 30 }
    validates_uniqueness_of :username, on: :create, message: "This username is already taken!"


    has_many :opinions, foreign_key: :author_id
    has_many :followings
    has_many :followers, class_name: 'Following', foreign_key: 'follower_id'
    has_many :followeds, class_name: 'Following', foreign_key: 'followed_id'
end
