class EventPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def edit?
    user.present? && user.events.include?(record)
  end

  def update?
    user.present? && user.events.include?(record)
  end

  def destroy?
    user.present? && user.events.include?(record)
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
