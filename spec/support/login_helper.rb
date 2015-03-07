module LoginHelper

  def iniciar_sesion email, password
    visit login_path
    fill_in 'email', with: email
    fill_in 'password', with: password
    click_button 'Iniciar Sesión'
  end
  
end
