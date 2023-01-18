class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?
    can :manage, Turn, client_id: user.id

    return unless user.manager?
    can [:read, :update], Turn, branch_id: user.branch_id
    can :read, Branch, id: user.branch_id
    can :read, User do |u|
      u.get_role == :client
    end

    return unless user.admin?
    can :manage, :all
  end
end
