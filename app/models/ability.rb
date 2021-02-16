# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    else
      can :read, Role
      can :read, Course
      can :read, Lesson
      can :read, Question
      can :read, QuestionOption
      can :read, Answer, user_id: user.id if user.persisted?
      can :read, CompletedLesson, user_id: user.id if user.persisted?
    end
  end
end
