class Branch < ApplicationRecord
  has_many :schedules, dependent: :destroy
  
  validates :name, :address, :phone, presence: true
end
