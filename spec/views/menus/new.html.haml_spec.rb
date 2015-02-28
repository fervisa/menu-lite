require 'rails_helper'

RSpec.describe "menus/new", type: :view do
  before(:each) do
    assign(:menu, Menu.new(
      :nombre => "MyString"
    ))
  end

  it "renders new menu form" do
    render

    assert_select "form[action=?][method=?]", menus_path, "post" do

      assert_select "input#menu_nombre[name=?]", "menu[nombre]"
    end
  end
end
