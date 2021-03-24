class User < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :username, presence: true, length: { maximum: 10 }
  validates :fullname, presence: true, length: { maximum: 30 }
  validates_uniqueness_of :username, on: :create, message: 'This username is already taken!'
  # validates :photo, blob: { content_type: :image }
  # validates :coverImage, blob: { content_type: :image }

  has_many :opinions, foreign_key: :author_id
  has_many :followings
  has_many :followers, class_name: 'Following', foreign_key: 'follower_id'
  has_many :follows, through: :followers, source: :followed
  has_many :followeds, class_name: 'Following', foreign_key: 'followed_id'
  has_many :followees, through: :followeds, source: :follower
  has_one_attached :photo, dependent: :destroy
  has_one_attached :coverImage, dependent: :destroy

  def suggested_followers
    # Get who the current user are following
    following = Following.select(:followed_id).where(follower_id: id)
    # Get who are the followers from current user
    followers = Following.select(:follower_id).where(followed_id: id)
    # Creates a friendship array with all relationships the current user has
    friendship = []

    following.map do |f|
      friendship.push(f.followed_id)
    end

    followers.map do |f|
      friendship.push(f.follower_id)
    end

    friendship.push(id)

    User.where.not(id: friendship)
  end

  def by_followeds
    # Get who the current user are following
    # following = Following.select(:followed_id).where(follower_id: self.id)
    # # Get who are the followers from current user
    followers = Following.select(:follower_id).where(followed_id: id)
    # Creates a friendship array with all relationships the current user has
    friendship = []

    # following.map do |f|
    #     friendship.push(f.followed_id)
    # end

    followers.map do |f|
      friendship.push(f.follower_id)
    end

    User.where(id: friendship)
    # This will produce SQL query with IN. Something like: select * from posts where user_id NOT IN (1,45,874,43);
  end

  def friends_and_own_posts
    Opinion.where(author_id: (follows.to_a << self))
    # This will produce SQL query with IN. Something like: select * from posts where user_id IN (1,45,874,43);
  end

  # Returns resized image
  def display_photo
    photo.variant(resize_to_limit: [50, 50])
  end

  def display_coverImage
    coverImage.variant(resize_to_limit: [600, 250])
  end
end
