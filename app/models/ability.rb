# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :read, ActiveAdmin::Page, namespace_name: :admin
      can :manage, :all
      cannot :update, [User, Review]
      can :update, User, id: user.id
    end
  end
end
