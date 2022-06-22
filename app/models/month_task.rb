class MonthTask < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true
  validates :content, presence: true, length: { maximum: 200 }
end
