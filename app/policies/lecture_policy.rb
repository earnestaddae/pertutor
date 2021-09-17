class LecturePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.present? && user.has_role?(:owner, lecture.account)
  end

  def new?
    create?
  end

  def update?
    create?
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end

  def show?
    user.present?
  end

  def index?
    show?
  end

  private

    def lecture
      record
    end
end
