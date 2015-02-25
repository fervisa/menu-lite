class CreatePlatillos < ActiveRecord::Migration
  def change
    create_table :platillos do |t|
      t.string :nombre
      t.integer :tipo, default: 0
      t.text :descripcion

      t.timestamps null: false
    end
  end
end
