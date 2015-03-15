json.array!(@menus) do |menu|
  json.extract! menu, :id, :nombre, :fecha
  json.title menu.nombre
  json.start menu.fecha
  json.end menu.fecha
  json.url menu_url(menu)
end
