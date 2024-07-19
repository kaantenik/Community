class MembershipRequestPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.has_role?(:admin)
        scope.all
      elsif user.has_role?(:president, :any)
        scope.joins(:club).where(clubs: { id: user.roles.where(name: 'president').pluck(:resource_id) })
      else
        scope.none
      end
    end
  end

  def update?
    user.present? && (user.has_role?(:president, record.club) || user.has_role?(:admin))
  end

  def destroy?
    update?
  end

  def approve?
    update?
  end

  def reject?
    update?
  end

  def show?
    user.present? && (user.has_role?(:president, record.club) || user.has_role?(:admin))
  end
end
