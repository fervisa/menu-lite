require 'rails_helper'

RSpec.describe Platillo, type: :model do
  it { should validate_presence_of :nombre }
  it { should validate_presence_of :tipo }
  it { should define_enum_for(:tipo).with(['entrada', 'guarnición', 'plato fuerte', 'postre', 'complemento', 'bebida']) }
end
