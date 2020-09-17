# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, User
    cannot :index, User
    can :read, [Post, Comment, Review]

    if user.present?
      can :manage, [Post, Comment, Review], user_id: user.id
      can :manage, User, id: user.id
      can :manage, :all if user.admin == true && user.present?
      can :manage, [Post, Comment, Review] if user.moderator == true && user.present?
    end
  end
end
