class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new #set guest user although you cant do much as a guest.

    if user.role? :member
        can :manage, Text, :user_id => user.id
    end

    if user.role? :paid
        #stuff will go here
    end

    if user.role? :admin
        can :manage, :all #Me only, yay!
    end
  end
end
