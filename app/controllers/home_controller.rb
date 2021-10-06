class HomeController < ApplicationController
  before_action :set_user

  def index
  end

  def set_user
    @user ||= current_user
  end
end
