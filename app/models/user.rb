class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :today_tasks, dependent: :destroy
  has_many :month_tasks, dependent: :destroy
  attachment :profile_image
  
  validates :name, uniqueness: true, presence: true, length: { minimum: 2, maximum: 20 }
  validates :profession, length: { maximum: 50 }
  
end