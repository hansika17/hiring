class BaseController < ApplicationController
  before_action :authenticate_user!

  after_action :verify_authorized

  LIMIT = 30

  def set_user
    @user ||= current_user
  end
end
