# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:

    can :read, User
    cannot :index, User
    can :read, [Post, Comment, Review]
    if user.present?
      can :manage, [Post, Comment, Review], user_id: user.id
      can :manage, User, id: user.id
      if user.admin?
        can :manage, :all
      end
    end

=begin
    user ||= User.new # guest user (not logged in)
    cannot :index, User
    can :show, User
    can :read, Post
    can :manage, Post, user_id: user.id
    can :manage, Comment, user_id: user.id
    return unless user.admin?
    can :manage, :all
=end


    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end