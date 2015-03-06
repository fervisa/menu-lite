require 'rails_helper'

RSpec.describe Usuario, type: :model do
  it { should validate_presence_of :email }
  it { should respond_to :password }
  it { should respond_to :password_confirmation }
  it { should validate_presence_of(:password).on :create }
end
