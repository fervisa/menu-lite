require 'rails_helper'

RSpec.describe Menu, type: :model do
  it { should have_and_belong_to_many :platillos }
end
