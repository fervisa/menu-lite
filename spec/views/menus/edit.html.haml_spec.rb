require 'rails_helper'

RSpec.describe "menus/edit", type: :view do
  before(:each) do
    @menu = assign(:menu, Menu.create!(
      :nombre => "MyString"
    ))
  end

  it "renders the edit menu form" do
    render

    assert_select "form[action=?][method=?]", menu_path(@menu), "post" do

      assert_select "input#menu_nombre[name=?]", "menu[nombre]"
    end
  end
end
