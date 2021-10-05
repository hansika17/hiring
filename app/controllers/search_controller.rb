class SearchController < BaseController
  def employee_skills
    authorize :search

    like_keyword = "%#{params[:q]}%"
    @employee = User.find(params[:id])
    @skills = Skill.where("name ILIKE ?", like_keyword)
      .limit(3).order(:name) - @employee.skills

    render layout: false
  end

  def surveys
    authorize :search
    like_keyword = "%#{params[:q]}%"
    @surveys = Survey::Survey.where("name ILIKE ?", like_keyword)
      .limit(10).order(:name)
    render layout: false
  end
end
