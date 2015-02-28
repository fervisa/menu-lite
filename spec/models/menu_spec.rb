require 'rails_helper'

RSpec.describe Menu, type: :model do
  it { should have_and_belong_to_many :platillos }
  it { should validate_presence_of :nombre }
  it { should validate_presence_of :fecha }
end
