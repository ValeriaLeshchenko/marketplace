class ApplicationController < ActionController::Base
  include SearchHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    seller_path(current_seller)
  end
  def after_sign_up_path_for(resource)
    seller_path(current_seller)
  end

end
