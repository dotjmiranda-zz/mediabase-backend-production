# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, [Post, Comment, Review]
    can :manage, :all if user.admin == true
    can :manage, [Post, Comment, Review] if user.moderator == true

    can :read, User
    cannot :index, User
    #can :read, [Post, Comment, Review]

    if user.present?
      can :manage, [Post, Comment, Review], user_id: user.id
      can :manage, User, id: user.id
    end
  end
end
