class Opinion < ApplicationRecord
  validates :text, presence: true, length: { maximum: 250 }
  
  belongs_to :author, class_name: 'User'
end
