class ClubPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    user.has_role?(:admin)
  end

  def new?
    create?
  end

  def update?
    user.has_role?(:admin)
  end

  def edit?
    update?
  end

  def destroy?
    user.has_role?(:admin)
  end
end
