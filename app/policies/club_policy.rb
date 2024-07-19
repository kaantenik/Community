class ClubPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end

  def approve_membership_request?
    user.present? && (user.has_role?(:president, record) || user.has_role?(:admin))
  end

  def reject_membership_request?
    user.present? && (user.has_role?(:president, record) || user.has_role?(:admin))
  end

  def membership_requests?
    user.present? && (user.has_role?(:president, record) || user.has_role?(:admin))
  end

  def show?
    true
  end

  def create?
    user.present? && (user.has_role?(:admin) || user.has_role?(:president, record))
  end

  def new?
    create?
  end

  def update?
    user.present? && (user.has_role?(:admin) || user.has_role?(:president, record))
  end

  def edit?
    update?
  end

  def destroy?
    user.present? && (user.has_role?(:admin) || user.has_role?(:president, record))
  end
end
