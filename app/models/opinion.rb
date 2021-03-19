class Opinion < ApplicationRecord
  validates :text, presence: true, length: { maximum: 500 }
  belongs_to :author, class_name: 'User'

  scope :ordered_by_most_recent, -> { includes(:author).order(created_at: :desc) }
end
