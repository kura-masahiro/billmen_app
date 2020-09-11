class BuildPost < ApplicationRecord
  belongs_to :user
  has_many :likes
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 3000 }
end
