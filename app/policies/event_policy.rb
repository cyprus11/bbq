class EventPolicy < ApplicationPolicy
  def show?
    (record.pincode.blank? ||
      (user.present? && user == record.user)) ||
      record.pincode_valid?(cookies["events_#{record.id}_pincode"])
  end

  def create?
    user.present?
  end

  def edit?
    user.present? && record.user == user
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
