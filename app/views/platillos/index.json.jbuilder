json.array!(@platillos) do |platillo|
  json.extract! platillo, :id, :nombre, :tipo, :descripcion
  json.url platillo_url(platillo, format: :json)
end
