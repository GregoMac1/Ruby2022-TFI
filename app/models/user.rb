class User < ApplicationRecord
  rolify
  has_secure_password
  after_create :assign_default_role

  def assign_default_role
    self.add_role(:client) if self.roles.blank?
  end

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
