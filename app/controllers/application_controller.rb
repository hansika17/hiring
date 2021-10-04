class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActionController::InvalidAuthenticityToken, with: :invalid_token
  rescue_from Pundit::NotDefinedError, with: :record_not_found
  rescue_from ActiveRecord::InvalidForeignKey, with: :show_referenced_alert

  before_action :set_redirect_path, unless: :user_signed_in?

  def set_redirect_path
    @redirect_path = request.path
  end
end
