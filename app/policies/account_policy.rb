class AccountPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true || user.present?
  end

  def new?
    create?
  end


  private

    def account
      record
    end
end
