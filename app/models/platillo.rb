class Platillo < ActiveRecord::Base
  enum tipo: ['entrada', 'guarnición', 'principal', 'postre', 'complemento', 'bebida']
  validates :nombre, :tipo, presence: true
end
