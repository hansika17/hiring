class BaseController < ApplicationController
  before_action :authenticate_user!

  after_action :verify_authorized

  LIMIT = 30

  def pagy_nil_safe(params, collection, vars = {})
    pagy = Pagy.new(count: collection.count(:all), page: params[:page], **vars)
    return pagy, collection.offset(pagy.offset).limit(pagy.items) if collection.respond_to?(:offset)
    return pagy, collection
  end
end
