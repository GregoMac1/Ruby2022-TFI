class User < ApplicationRecord
  has_one :branch, dependent: :destroy

  validates :email, :name, :password, presence: true
end
