# Preview all emails at http://localhost:3000/rails/mailers/menus_mailer
class MenusMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/menus_mailer/enviar
  def enviar
    MenusMailer.enviar
  end

end
