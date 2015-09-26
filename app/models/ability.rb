class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= AdminUser.new # guest user (not logged in)
    if user.super
      can :manage, :all
    end
  end
end
