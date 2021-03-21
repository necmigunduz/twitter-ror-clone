class User < ApplicationRecord
    validates :username, presence: true, length: { maximum: 10 }
    validates :fullname, presence: true, length: { maximum: 30 }
    validates_uniqueness_of :username, on: :create, message: "This username is already taken!"


    has_many :opinions, foreign_key: :author_id
    has_many :followings
    has_many :followers, class_name: 'Following', foreign_key: 'follower_id'
    has_many :followeds, class_name: 'Following', foreign_key: 'followed_id'

    def suggested_followers
        # Get who the current user are following
        following = Following.select(:followed_id).where(follower_id: self.id)
        # Get who are the followers from current user
        followers = Following.select(:follower_id).where(followed_id: self.id)
        
        # Creates a friendship array with all relationships the current user has
        friendship = []

        following.map do |f|
            friendship.push(f.followed_id)
        end
        followers.map do |f|
            friendship.push(f.follower_id)
        end
        friendship.push(self.id)


        User.where.not(id: friendship)
        # This will produce SQL query with IN. Something like: select * from posts where user_id NOT IN (1,45,874,43);
    end
end
