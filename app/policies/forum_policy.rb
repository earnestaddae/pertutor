class ForumPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def index?
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

    def forum
      record
    end
end
