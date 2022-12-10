class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_user_logged_in!
    redirect_to sign_in_path, alert: "No has iniciado sesión." if Current.user.nil?
  end

  def require_user_not_logged_in!
    redirect_to root_path, notice: "Ya has iniciado sesión." unless Current.user.nil?
  end

  def require_admin!
    redirect_to root_path, alert: "No tienes permisos para acceder a esta página." unless Current.user.has_role? :admin
  end

  def require_manager!
    redirect_to root_path, alert: "No tienes permisos para acceder a esta página." unless Current.user.has_role? :manager
  end

  def require_at_least_manager!
    if (Current.user.has_role?(:manager) || Current.user.has_role?(:admin))
      return
    else
      redirect_to root_path, alert: "No tienes permisos para acceder a esta página."
    end
  end
end
