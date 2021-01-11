class EventPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def edit?
    user.present? && user.events.include?(record)
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
