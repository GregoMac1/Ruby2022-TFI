class Branch < ApplicationRecord
  validates :name, :address, :phone, presence: true
end
