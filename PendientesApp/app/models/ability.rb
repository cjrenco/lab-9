# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    
    return unless user.present?
    can :manage, Task, user_id: user.id
  end
end
