require 'rails_helper'

RSpec.describe "menus/index", type: :view do
  before(:each) do
    assign(:menus, [
      Menu.create!(
        :nombre => "Nombre"
      ),
      Menu.create!(
        :nombre => "Nombre"
      )
    ])
  end

  it "renders a list of menus" do
    render
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
  end
end
