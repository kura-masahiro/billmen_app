class User < ApplicationRecord
  has_many :electric_posts, dependent: :destroy
  has_many :boil_posts, dependent: :destroy
  has_many :freeze_posts, dependent: :destroy
  has_many :danger_posts, dependent: :destroy
  has_many :build_posts, dependent: :destroy
  has_many :likes
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable
         
   mount_uploader :image, ImageUploader
   def self.guest
   find_or_create_by!(username: 'ゲストユーザー',  email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.now 
    end
  end

end
