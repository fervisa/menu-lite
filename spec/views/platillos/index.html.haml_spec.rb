require 'rails_helper'

RSpec.describe "platillos/index", type: :view do
  before(:each) do
    assign(:platillos, [
      Platillo.create!(
        :nombre => "Nombre",
        :tipo => 1,
        :descripcion => "MyText"
      ),
      Platillo.create!(
        :nombre => "Nombre",
        :tipo => 1,
        :descripcion => "MyText"
      )
    ])
  end

  it "renders a list of platillos" do
    render
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
