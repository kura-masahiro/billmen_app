class User < ApplicationRecord
  has_many :electric_posts, dependent: :destroy
  has_many :boil_posts, dependent: :destroy
  has_many :freeze_posts, dependent: :destroy
  has_many :danger_posts, dependent: :destroy
  has_many :build_posts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable
end
