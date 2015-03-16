require 'rails_helper'

feature 'Gestión de menús' do

  background do
    crear_platillos
    usuario = FactoryGirl.create :usuario, email: 'usuario@mail.com', password: 'abc123', password_confirmation: 'abc123'
    iniciar_sesion usuario.email, 'abc123'
  end

  scenario 'menu de platillos existentes', js: true do
    expect{
      acceder_a_nuevo_menu
      rellenar_formulario_menu
      agregar_platillos_a_menu
      click_button 'Guardar menu'
    }.to change{ Menu.count }.by 1

    expect(page).to have_content 'Menu 1'

    click_link 'Menu 1'
    expect(page).not_to have_content 'Platillo 1'
    expect(page).to have_content 'Platillo 2'
    expect(page).to have_content 'Platillo 3'
  end

  scenario 'menu de platillos nuevos', js: true do
    expect{
      acceder_a_nuevo_menu
      rellenar_formulario_menu
      agregar_platillos_a_menu
      agregar_nuevo_platillo_a_menu
      click_button 'Guardar menu'
    }.to change{ Menu.count }.by 1

    expect(page).to have_content 'Menu 1'

    click_link 'Menu 1'

    expect(page).not_to have_content 'Platillo 1'
    expect(page).to have_content 'Platillo 2'
    expect(page).to have_content 'Platillo 3'
    expect(page).to have_content 'Platillo 4'
  end

  scenario 'agregar platillo a menu existente', js: true do
    menu = FactoryGirl.create :menu, platillo_ids: Platillo.pluck(:id)

    visit edit_menu_path menu
    agregar_nuevo_platillo_a_menu
    click_button 'Guardar menu'

    expect(page).to have_content menu.nombre

    click_link menu.nombre

    expect(page).to have_content 'Platillo 1'
    expect(page).to have_content 'Platillo 2'
    expect(page).to have_content 'Platillo 3'
    expect(page).to have_content 'Platillo 4'
  end

  scenario 'eliminar platillo de menu existente', js: true do
    menu = FactoryGirl.create :menu, platillo_ids: Platillo.pluck(:id)

    visit edit_menu_path menu
    all('#platillos a.delete').last.click
    click_button 'Guardar menu'

    expect(page).to have_content menu.nombre

    click_link menu.nombre

    expect(page).to have_content 'Platillo 1'
    expect(page).to have_content 'Platillo 2'
    expect(page).not_to have_content 'Platillo 3'
  end

  def acceder_a_nuevo_menu
    click_link 'Nuevo Menú'
  end

  def crear_platillos
    FactoryGirl.create :platillo, nombre: 'Platillo 1'
    FactoryGirl.create :platillo, nombre: 'Platillo 2'
    FactoryGirl.create :platillo, nombre: 'Platillo 3'
  end

  def rellenar_formulario_menu
    within '#new_menu' do
      fill_in 'Nombre', with: 'Menu 1'
      fill_in 'Fecha', with: Date.today.to_s
    end
  end

  def agregar_platillos_a_menu
    within '#platillos_form' do 
      select 'Platillo 2', from: 'id'
      click_button 'Agregar'
      select 'Platillo 3', from: 'id'
      click_button 'Agregar'
    end
  end

  def agregar_nuevo_platillo_a_menu
    find('a[href="#new-platillo"]').click
    within '#new_platillo' do
      fill_in 'Nombre', with: 'Platillo 4'
      select 'plato fuerte', from: 'Tipo'
      click_button 'Crear y agregar'
    end
  end
end

feature 'Envío de menús' do
  background do
    crear_menus
    usuario = FactoryGirl.create :usuario, email: 'usuario@mail.com', password: 'abc123', password_confirmation: 'abc123'
    iniciar_sesion usuario.email, 'abc123'
  end

  scenario 'envío de menús por rango de fechas', js: true do
    click_link 'Enviar menús'
    fill_in 'envio_desde', with: '2015-02-01'
    fill_in 'envio_hasta', with: '2015-02-04'
    fill_in 'envio_email', with: 'maestra@escuelita.com'
    within '#menus' do
      expect(page).to have_content 'Platillo 1'
      expect(page).to have_content 'Platillo 2'
      expect(page).not_to have_content 'Platillo 3'
    end
    click_button 'Enviar menús'
    expect(page).to have_content 'Los menús han sido enviados exitosamente al correo maestra@escuelita.com'
  end

  def crear_menus
    platillo_1 = FactoryGirl.create :platillo, nombre: 'Platillo 1'
    platillo_2 = FactoryGirl.create :platillo, nombre: 'Platillo 2'
    platillo_3 = FactoryGirl.create :platillo, nombre: 'Platillo 3'

    FactoryGirl.create :menu, platillo_ids: [platillo_1.id], fecha: Date.parse('2015-02-01')
    FactoryGirl.create :menu, platillo_ids: [platillo_2.id], fecha: Date.parse('2015-02-04')
    FactoryGirl.create :menu, platillo_ids: [platillo_3.id], fecha: Date.parse('2015-02-08')
  end
end
