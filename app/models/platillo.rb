class Platillo < ActiveRecord::Base
  enum tipo: ['entrada', 'guarnición', 'plato fuerte', 'postre']
  validates :nombre, :tipo, presence: true
end
