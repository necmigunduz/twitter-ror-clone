class Opinion < ApplicationRecord
  validates :text, presence: true, length: { maximum: 500 }
  
  belongs_to :author, class_name: 'User'
  

  scope :ordered_by_most_recent, -> { includes(:author).order(created_at: :desc) }

  def names(user_id)
    user_name = User.select("fullname").where("id=#{user_id}").take
    user_name 
  end

end
