class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user.try(:password) == params[:session][:password]
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Iniciaste sesión exitosamente'
    else
      redirect_to new_session_path, alert: 'El e-mail o contraseña que ingresaste son incorrectos'
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'Tu sesión fue cerrada exitosamente'
  end
end
