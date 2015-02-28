class CreateMenusPlatillos < ActiveRecord::Migration
  def change
    create_table :menus_platillos, id: false do |t|
      t.belongs_to :menu, index: true
      t.belongs_to :platillo, index: true
    end
  end
end
