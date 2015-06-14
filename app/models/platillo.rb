class Platillo < ActiveRecord::Base
  PRINCIPAL = 2

  scope :principal_first, -> { order "tipo = #{ sanitize(PRINCIPAL) } DESC" }

  enum tipo: ['entrada', 'guarnición', 'principal', 'postre', 'complemento', 'bebida']
  validates :nombre, :tipo, presence: true
end
