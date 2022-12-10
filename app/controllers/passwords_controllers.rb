class PasswordsController < ApplicationController
  before_action :require_user_logged_in!

  def edit
  end

  def update
    if Current.user.update(password_params)
      redirect_to root_path, notice: "Se ha actualizado la contraseña."
    else
      redirect_to edit_password_path, alert: "Ocurrió un error al actualizar la contraseña."
    end
  end

  private
  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
