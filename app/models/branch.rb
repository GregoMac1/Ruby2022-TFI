class Branch < ApplicationRecord
  has_many :schedules
  
  validates :name, :address, :phone, presence: true
end
