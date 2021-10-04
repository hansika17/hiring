class AccountPolicy < Struct.new(:user, :account)
  def index?
    true
  end

  def edit?
    true
  end

  def create?
    true
  end

  def destroy?
    true
  end

  def show?
    true
  end

  def update?
    true
  end
end
