class Branch < ApplicationRecord
  has_many :schedules, dependent: :destroy
  has_many :turns, dependent: :destroy
  
  validates :name, :address, :phone, presence: true
end
