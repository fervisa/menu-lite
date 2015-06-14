class Menu < ActiveRecord::Base
  has_and_belongs_to_many :platillos, -> { merge(Platillo.principal_first) }
  validates :nombre, :fecha, presence: true
end
