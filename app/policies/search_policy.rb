class SearchPolicy < Struct.new(:user, :search)
  def employee_skills?
    true
  end

  def surveys?
    user.admin?
  end
end
