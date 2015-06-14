require 'rails_helper'

RSpec.describe Menu, type: :model do
  it { should have_and_belong_to_many :platillos }
  it { should validate_presence_of :nombre }
  it { should validate_presence_of :fecha }

  describe "#platillos" do
    let(:menu) { FactoryGirl.create :menu }
    let(:principal) { FactoryGirl.create :platillo, tipo: :principal }

    it "should return 'principal' dishes first" do
      menu.platillos << FactoryGirl.create_list(:platillo, 2, tipo: 1)
      menu.platillos << principal
      menu.platillos << FactoryGirl.create_list(:platillo, 2, tipo: 3)
      expect(menu.platillos.first).to eq principal
    end
  end
end
