require 'rails_helper'

RSpec.describe "Platillos", type: :request do
  describe "GET /platillos" do
    it "works! (now write some real specs)" do
      get platillos_path
      expect(response).to have_http_status(200)
    end
  end
end
