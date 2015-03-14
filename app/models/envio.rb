class Envio
  include ActiveModel::Model

  attr_accessor :desde, :hasta, :email

  validates :desde, :hasta, :email, presence: true
  validate :ensure_dates_range

  private

  def ensure_dates_range
    errors.add :base, 'Las fecha final debe ser mayor o igual a la fecha inicial' if desde && hasta && hasta < desde
  end
end
