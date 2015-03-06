require 'rails_helper'

feature 'Inicio de sesión' do

  background do
    FactoryGirl.create :usuario, email: 'usuario@mail.com', password: 'abc123', password_confirmation: 'abc123'
  end

  scenario 'inicio de sesión exitoso', js: true do
    visit login_path
    fill_in 'email', with: 'usuario@mail.com'
    fill_in 'password', with: 'abc123'
    click_button 'Iniciar Sesión'
    expect(current_path).to match 'menus'
    expect(page).to have_content 'Menús'
  end

  scenario 'inicio de sesión fallido', js: true do
    visit login_path
    fill_in 'email', with: 'usuario@mail.com'
    fill_in 'password', with: 'xabc123'
    click_button 'Iniciar Sesión'
    expect(current_path).to match 'ingresar'
    expect(page).to have_content 'Nombre de usuario o contraseña no válidos'
  end
end
