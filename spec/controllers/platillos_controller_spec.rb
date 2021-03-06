require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe PlatillosController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Platillo. As you add validations to Platillo, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { nombre: 'Platillo 1', tipo: 'entrada' }
  }

  let(:invalid_attributes) {
    { nombre: 'Platillo 1', tipo: '' }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PlatillosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  let(:usuario) { FactoryGirl.create :usuario, email: 'usuario@mail.com', password: 'hola', password_confirmation: 'hola' }

  before :each do
    allow(controller).to receive(:current_usuario).and_return usuario
  end

  describe "GET #index" do
    it "assigns all platillos as @platillos" do
      platillo = Platillo.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:platillos)).to eq([platillo])
    end
  end

  describe "GET #show" do
    it "assigns the requested platillo as @platillo" do
      platillo = Platillo.create! valid_attributes
      get :show, {:id => platillo.to_param}, valid_session
      expect(assigns(:platillo)).to eq(platillo)
    end
  end

  describe "GET #new" do
    it "assigns a new platillo as @platillo" do
      get :new, {}, valid_session
      expect(assigns(:platillo)).to be_a_new(Platillo)
    end
  end

  describe "GET #edit" do
    it "assigns the requested platillo as @platillo" do
      platillo = Platillo.create! valid_attributes
      get :edit, {:id => platillo.to_param}, valid_session
      expect(assigns(:platillo)).to eq(platillo)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Platillo" do
        expect {
          post :create, {:platillo => valid_attributes}, valid_session
        }.to change(Platillo, :count).by(1)
      end

      it "assigns a newly created platillo as @platillo" do
        post :create, {:platillo => valid_attributes}, valid_session
        expect(assigns(:platillo)).to be_a(Platillo)
        expect(assigns(:platillo)).to be_persisted
      end

      it "redirects to platillos index" do
        post :create, {:platillo => valid_attributes}, valid_session
        expect(response).to redirect_to(platillos_path)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved platillo as @platillo" do
        post :create, {:platillo => invalid_attributes}, valid_session
        expect(assigns(:platillo)).to be_a_new(Platillo)
      end

      it "re-renders the 'new' template" do
        post :create, {:platillo => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested platillo" do
        platillo = Platillo.create! valid_attributes
        put :update, {:id => platillo.to_param, :platillo => new_attributes}, valid_session
        platillo.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested platillo as @platillo" do
        platillo = Platillo.create! valid_attributes
        put :update, {:id => platillo.to_param, :platillo => valid_attributes}, valid_session
        expect(assigns(:platillo)).to eq(platillo)
      end

      it "redirects to platillos index" do
        platillo = Platillo.create! valid_attributes
        put :update, {:id => platillo.to_param, :platillo => valid_attributes}, valid_session
        expect(response).to redirect_to(platillos_path)
      end
    end

    context "with invalid params" do
      it "assigns the platillo as @platillo" do
        platillo = Platillo.create! valid_attributes
        put :update, {:id => platillo.to_param, :platillo => invalid_attributes}, valid_session
        expect(assigns(:platillo)).to eq(platillo)
      end

      it "re-renders the 'edit' template" do
        platillo = Platillo.create! valid_attributes
        put :update, {:id => platillo.to_param, :platillo => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested platillo" do
      platillo = Platillo.create! valid_attributes
      expect {
        delete :destroy, {:id => platillo.to_param}, valid_session
      }.to change(Platillo, :count).by(-1)
    end

    it "redirects to the platillos list" do
      platillo = Platillo.create! valid_attributes
      delete :destroy, {:id => platillo.to_param}, valid_session
      expect(response).to redirect_to(platillos_url)
    end
  end

end
