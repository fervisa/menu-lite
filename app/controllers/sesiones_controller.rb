class SesionesController < ApplicationController
  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.find_by_email params[:email]
    if @usuario && @usuario.authenticate(params[:password])
      session[:usuario_id] = @usuario.id
      redirect_to menus_path
    else
      render 'new'
    end
  end

  def destroy
    session[:usuario_id] = nil
    redirect_to login_path
  end
end
