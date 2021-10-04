class Account::BaseController < BaseController
  before_action :authenticate_user!

  after_action :verify_authorized
  before_action :set_user

  def set_user
    @user ||= current_user
  end
end
