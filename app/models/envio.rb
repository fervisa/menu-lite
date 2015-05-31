class Envio
  include ActiveModel::Model

  attr_accessor :desde, :hasta, :email

  validates :desde, :hasta, presence: true
  validate :ensure_dates_range

  def menus
    @menus ||= Menu.where(fecha: desde.to_date..hasta.to_date).order('fecha ASC')
  end

  private

  def ensure_dates_range
    errors.add :base, 'Las fecha final debe ser mayor o igual a la fecha inicial' if desde && hasta && hasta < desde
  end
end
