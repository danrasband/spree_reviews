class ReviewAbility
  include CanCan::Ability

  def initialize(user)
    if user.is_admin?
      can :manage, :all
    end

    can :create, Spree::Review do |review|
      !user.id.nil?
    end
  end
end
