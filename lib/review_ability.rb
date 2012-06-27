class ReviewAbility
  include CanCan::Ability

  def initialize(user)
    if user.has_role?(:admin)
      can :manage, :all
    end

    can :create, Spree::Review do |review|
      !user.id.nil?
    end

    can :read, Spree::Review do |review|
      review.approved? || user.has_role?(:admin)
    end
  end
end
