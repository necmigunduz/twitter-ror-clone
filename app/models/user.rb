class User < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :username, presence: true, length: { maximum: 10 }
  validates :fullname, presence: true, length: { maximum: 30 }
  validates_uniqueness_of :username, on: :create, message: 'This username is already taken!'

  has_many :opinions, foreign_key: :author_id
  has_many :followings
  has_many :followers, class_name: 'Following', foreign_key: 'follower_id'
  has_many :follows, through: :followers, source: :followed
  has_many :followeds, class_name: 'Following', foreign_key: 'followed_id'
  has_many :followees, through: :followeds, source: :follower
  has_one_attached :photo, dependent: :destroy
  has_one_attached :coverImage, dependent: :destroy

  scope :followed_ordered_by_most_recent, -> { includes(:followeds).order(created_at: :desc) }
  scope :follower_ordered_by_most_recent, -> { includes(:followeds).order(created_at: :desc) }

  def suggested_followers
    following = Following.select(:followed_id).where(follower_id: id)
    followers = Following.select(:follower_id).where(followed_id: id)
    friendship = []

    following.map do |f|
      friendship.push(f.followed_id)
    end

    followers.map do |f|
      friendship.push(f.follower_id)
    end

    friendship.push(id)

    User.where.not(id: friendship).follower_ordered_by_most_recent.take(10)
  end

  def by_followeds
    followers = Following.select(:follower_id).where(followed_id: id)
    friendship = []

    followers.map do |f|
      friendship.push(f.follower_id)
    end

    User.where(id: friendship).follower_ordered_by_most_recent  
  end

  def friends_and_own_posts
    Opinion.where(author_id: (follows.to_a << self))
  end

  def display_photo
    photo.variant(resize_to_limit: [50, 50])
  end

  def display_cover_image
    coverImage.variant(resize_to_limit: [600, 250])
  end
end
