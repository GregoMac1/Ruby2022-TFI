class User < ApplicationRecord
  rolify
  has_secure_password
  after_create :assign_default_role

  def assign_default_role
    self.add_role(:client) if self.roles.blank?
  end

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 8 }
  validates :branch_id, presence: { message: "Debe seleccionar una sucursal" }, if: :manager?

  def admin?
    self.has_role? :admin
  end

  def manager?
    self.has_role? :manager
  end

  def get_role
    if self.has_role? :admin
      return :admin
    elsif self.has_role? :manager
      return :manager
    else
      return :client
    end
  end

  def get_role_name
    case self.get_role
    when :admin
      return "Administrador"
    when :manager
      return "Personal"
    else
      return "Cliente"
    end
  end

  def remove_roles
    self.remove_role :admin
    self.remove_role :manager
    self.remove_role :client
  end
end
