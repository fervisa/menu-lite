require 'rails_helper'

RSpec.describe SesionesController, type: :controller do
  let(:usuario) { FactoryGirl.create :usuario, email: 'usuario@mail.com', password: 'hola', password_confirmation: 'hola' }

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders 'new' template" do
      get :new
      expect(response).to render_template 'new'
    end
  end

  describe "GET #create" do

    context 'valid user' do
      it "returns http success" do
        post :create, email: usuario.email, password: 'hola'
        expect(response).to have_http_status(:redirect)
      end

      it "redirects to menus index" do
        post :create, email: usuario.email, password: 'hola'
        expect(response).to redirect_to menus_path
      end

      it "saves usuario_id into session" do
        expect{
          post :create, email: usuario.email, password: 'hola'
        }.to change{ session[:usuario_id] }.to usuario.id
      end
    end

    context 'invalid user' do
      it "returns http success" do
        post :create, email: usuario.email, password: 'hola1'
        expect(response).to have_http_status(:success)
      end

      it "renders sesiones#new" do
        post :create, email: usuario.email, password: 'hola1'
        expect(response).to render_template 'new'
      end

      it "leaves usuario_id session blank" do
        expect{
          post :create, email: usuario.email, password: 'hola1'
        }.not_to change{ session[:usuario_id] }
      end
    end
  end

  describe "GET #destroy" do
    before :each do
      session[:usuario_id] = usuario.id
    end

    it "returns http redirect" do
      delete :destroy
      expect(response).to have_http_status(:redirect)
    end

    it "redirects to login page" do
      delete :destroy
      expect(response).to redirect_to login_path
    end

    it "clears usuario_id from session" do
      expect{
        delete :destroy
      }.to change{ session[:usuario_id] }.from(usuario.id).to nil
    end
  end

end
