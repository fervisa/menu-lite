class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :nombre
      t.date :fecha

      t.timestamps null: false
    end
  end
end
