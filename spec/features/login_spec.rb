require 'rails_helper'

feature 'Inicio de sesión' do

  background do
    FactoryGirl.create :usuario, email: 'usuario@mail.com', password: 'abc123', password_confirmation: 'abc123'
  end

  scenario 'inicio de sesión exitoso', js: true do
    iniciar_sesion 'usuario@mail.com', 'abc123'
    expect(current_path).to match 'menus'
    expect(page).to have_content 'Menús'
    expect(page).to have_content 'Has iniciado sesión correctamente'
  end

  scenario 'inicio de sesión fallido', js: true do
    iniciar_sesion 'usuario@mail.com', 'xabc123'
    expect(current_path).to match 'ingresar'
    expect(page).to have_content 'Nombre de usuario o contraseña no válidos'
  end
end
