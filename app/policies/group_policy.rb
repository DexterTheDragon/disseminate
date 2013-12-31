class GroupPolicy < ApplicationPolicy
  def show?   ; true; end
  def create? ; true; end
  def update? ; record.user == user; end
  def destroy?; record.user == user; end

  self::Scope = Struct.new(:user, :scope) do
    def resolve
      scope.where(user: user)
    end
  end
end
