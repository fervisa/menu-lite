class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_usuario

  def current_usuario
    @current_usuario ||= Usuario.find(session[:usuario_id]) if session[:usuario_id]
  end

  private

  def authenticate!
    redirect_to login_path, alert: 'No estás autorizado para acceder a esta página' unless current_usuario
  end
end
