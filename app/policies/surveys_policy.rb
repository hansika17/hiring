class SurveysPolicy < Struct.new(:user, :surveys)
  def index?
    true
  end

  def update?
    true
  end

  def create?
    true
  end

  def edit?
    true
  end

  def new?
    true
  end

  def destroy?
    true
  end

  def show?
    true
  end

  def clone?
    true
  end

  def assignees?
    true
  end
end
