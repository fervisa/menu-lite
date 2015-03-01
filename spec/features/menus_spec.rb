require 'rails_helper'

feature 'Gestión de menús' do

  background do
    crear_platillos
  end

  scenario 'menu de platillos existentes', js: true do
    expect{
      acceder_a_nuevo_menu
      rellenar_formulario_menu
      agregar_platillos_a_menu
      click_button 'Guardar menu'
    }.to change{ Menu.count }.by 1

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

    expect(page).to have_content 'Platillo 1'
    expect(page).to have_content 'Platillo 2'
    expect(page).not_to have_content 'Platillo 3'
  end

  def acceder_a_nuevo_menu
    visit menus_path
    click_link 'Nuevo Menu'
  end

  def crear_platillos
    FactoryGirl.create :platillo, nombre: 'Platillo 1'
    FactoryGirl.create :platillo, nombre: 'Platillo 2'
    FactoryGirl.create :platillo, nombre: 'Platillo 3'
  end

  def rellenar_formulario_menu
    within '#new_menu' do
      fill_in 'Nombre', with: 'Menu 1'
      select '2015', from: 'menu_fecha_1i'
      select 'February', from: 'menu_fecha_2i'
      select '2', from: 'menu_fecha_3i'
    end
  end

  def agregar_platillos_a_menu
    select 'Platillo 2', from: 'platillo_id'
    click_button 'Agregar'
    select 'Platillo 3', from: 'platillo_id'
    click_button 'Agregar'
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
