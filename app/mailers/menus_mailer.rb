class MenusMailer < ApplicationMailer
  layout false

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.menus_mailer.enviar.subject
  #
  def enviar envio, usuario
    @envio = envio
    @menus = Menu.where(fecha: envio.desde.to_date..envio.hasta.to_date).order('fecha ASC')
    mail to: envio.email, bcc: usuario.email, from: usuario.email, subject: 'Envío de menús'
  end
end
