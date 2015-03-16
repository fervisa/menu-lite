class Platillo < ActiveRecord::Base
  enum tipo: ['entrada', 'guarnición', 'plato fuerte', 'postre', 'complemento', 'bebida']
  validates :nombre, :tipo, presence: true
end
