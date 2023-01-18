class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def current_user
    Current.user
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: "No tiene permisos para acceder a esta página."
  end

  def require_user_logged_in!
    redirect_to sign_in_path, alert: "No ha iniciado sesión." if Current.user.nil?
  end

  def require_user_not_logged_in!
    redirect_to root_path, notice: "Ya ha iniciado sesión." unless Current.user.nil?
  end

  def require_admin!
    redirect_to root_path, alert: "No tiene permisos para acceder a esta página." unless Current.user.has_role? :admin
  end

  def require_manager!
    redirect_to root_path, alert: "No tiene permisos para acceder a esta página." unless Current.user.has_role? :manager
  end

  def require_client!
    redirect_to root_path, alert: "No tiene permisos para acceder a esta página." unless Current.user.has_role? :client
  end

  def require_at_least_manager!
    if (Current.user.has_role?(:manager) || Current.user.has_role?(:admin))
      return
    else
      redirect_to root_path, alert: "No tiene permisos para acceder a esta página."
    end
  end
end
