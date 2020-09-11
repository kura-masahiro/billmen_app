class Like < ApplicationRecord
  belongs_to :user
  belongs_to :electric_posts, dependent: :destroy 
  belongs_to :boil_posts, dependent: :destroy 
  belongs_to :freeze_posts, dependent: :destroy 
  belongs_to :danger_posts, dependent: :destroy 
  belongs_to :build_posts, dependent: :destroy 
end