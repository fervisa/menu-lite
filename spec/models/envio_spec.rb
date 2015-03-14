require 'rails_helper'

describe Envio do
  it { should validate_presence_of :desde }
  it { should validate_presence_of :hasta }
  it { should validate_presence_of :email }

  describe 'date ranges' do
    it 'should validate date overlapping' do
      envio = Envio.new email: 'yo@mail.com', desde: Date.parse('05-02-2015'), hasta: Date.parse('01-02-2015')
      envio.validate
      expect(envio.errors[:base]).to include 'Las fecha final debe ser mayor o igual a la fecha inicial'
    end
  end
end
