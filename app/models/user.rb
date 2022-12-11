class User < ApplicationRecord
  has_many :turns
  rolify
  has_secure_password
  after_create :assign_default_role

  def assign_default_role
    self.add_role(:client) if self.roles.blank?
  end

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  def get_role
    if self.has_role? :admin
      return :admin
    elsif self.has_role? :manager
      return :manager
    else
      return :client
    end
  end

  def remove_roles
    self.remove_role :admin
    self.remove_role :manager
    self.remove_role :client
  end
end
