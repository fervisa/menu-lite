require 'rails_helper'

RSpec.describe Platillo, type: :model do
  it { should validate_presence_of :nombre }
  it { should validate_presence_of :tipo }
  it { should define_enum_for(:tipo).with(['entrada', 'guarnición', 'principal', 'postre', 'complemento', 'bebida']) }

  describe ".principal_first" do
    let(:principal) { FactoryGirl.create :platillo, tipo: :principal }

    it "should return 'principal' dishes first" do
      FactoryGirl.create_list(:platillo, 2, tipo: 1)
      principal
      FactoryGirl.create_list(:platillo, 2, tipo: 3)
      expect(Platillo.principal_first.first).to eq principal
    end
  end
end
