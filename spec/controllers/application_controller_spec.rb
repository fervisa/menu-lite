require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
    before_filter :authenticate!

    def index
      render nothing: true
    end
  end

  describe 'with logged in user' do
    let(:usuario) { FactoryGirl.create :usuario, email: 'usuario@mail.com', password: 'hola', password_confirmation: 'hola' }

    before :each do
      session[:usuario_id] = usuario.id
    end

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'loads current_usuario' do
      get :index
      expect(controller.current_usuario).to eq usuario
    end
  end

  describe 'with no logged in user' do
    it 'does not load current_usuario' do
      get :index
      expect(controller.current_usuario).to be_nil
    end

    it 'redirects to login_path' do
      get :index
      expect(response).to redirect_to login_path
    end

    it 'shos an error message' do
      get :index
      expect(flash[:alert]).to match /No estás autorizado/
    end
  end

end
