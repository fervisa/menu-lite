require 'rails_helper'

RSpec.describe "platillos/edit", type: :view do
  before(:each) do
    @platillo = assign(:platillo, Platillo.create!(
      :nombre => "MyString",
      :tipo => 1,
      :descripcion => "MyText"
    ))
  end

  it "renders the edit platillo form" do
    render

    assert_select "form[action=?][method=?]", platillo_path(@platillo), "post" do

      assert_select "input#platillo_nombre[name=?]", "platillo[nombre]"

      assert_select "input#platillo_tipo[name=?]", "platillo[tipo]"

      assert_select "textarea#platillo_descripcion[name=?]", "platillo[descripcion]"
    end
  end
end
