class Survey::QuestionPolicy < Survey::BaseSurveyPolicy
  def index?
    true
  end

  def new?
    true
  end

  def edit?
    true
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    true
  end
end