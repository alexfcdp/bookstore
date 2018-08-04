# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  def authenticate_active_admin_user!
    authenticate_user!
    return if current_user.admin?
    flash[:alert] = 'Unauthorized Access!'
    redirect_to root_path
  end
end
