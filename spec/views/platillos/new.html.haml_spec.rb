require 'rails_helper'

RSpec.describe "platillos/new", type: :view do
  before(:each) do
    assign(:platillo, Platillo.new(
      :nombre => "MyString",
      :tipo => 1,
      :descripcion => "MyText"
    ))
  end

  it "renders new platillo form" do
    render

    assert_select "form[action=?][method=?]", platillos_path, "post" do

      assert_select "input#platillo_nombre[name=?]", "platillo[nombre]"

      assert_select "input#platillo_tipo[name=?]", "platillo[tipo]"

      assert_select "textarea#platillo_descripcion[name=?]", "platillo[descripcion]"
    end
  end
end
