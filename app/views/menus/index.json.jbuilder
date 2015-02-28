json.array!(@menus) do |menu|
  json.extract! menu, :id, :nombre, :fecha
  json.url menu_url(menu, format: :json)
end
