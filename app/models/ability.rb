class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= AdminUser.new # guest user (not logged in)
    can :manage, :all if user.super
  end
end
