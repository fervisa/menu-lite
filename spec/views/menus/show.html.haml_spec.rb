require 'rails_helper'

RSpec.describe "menus/show", type: :view do
  before(:each) do
    @menu = assign(:menu, Menu.create!(
      :nombre => "Nombre"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nombre/)
  end
end
