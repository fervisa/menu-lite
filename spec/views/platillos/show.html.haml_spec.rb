require 'rails_helper'

RSpec.describe "platillos/show", type: :view do
  before(:each) do
    @platillo = assign(:platillo, Platillo.create!(
      :nombre => "Nombre",
      :tipo => 1,
      :descripcion => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nombre/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
  end
end
