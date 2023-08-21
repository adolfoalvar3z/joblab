class CreateOferta < ActiveRecord::Migration[7.0]
  def change
    create_table :oferta do |t|
      t.string :cargo
      t.text :descripcion
      t.string :rango
      t.string :estado, null: false, default: "abierto"

      t.timestamps
    end
  end
end
