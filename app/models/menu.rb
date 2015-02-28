class Menu < ActiveRecord::Base
  has_and_belongs_to_many :platillos
  validates :nombre, :fecha, presence: true
end
