class Survey::BaseController < BaseController
  before_action :set_survey, only: %i[show edit update destroy]
  include Pagy::Backend
  helper_method :resolve_redirect_path

  LIMIT = 10

  private

  def resolve_redirect_path(attempt)
    if attempt.survey.survey_for == "user"
      survey_attempts_path(attempt.survey)
    elsif attempt.survey.survey_for == "candidate"
      survey_attempts_path(attempt.survey)
    end
  end

  def set_survey
    @survey ||= Survey::Survey.find(params[:id])
  end
end

class String
  def resolve_class
    klass = self
    if self == "adhoc"
      klass = "user"
    end
    klass.capitalize.constantize
  end
end
