class CreatePlastics < ActiveRecord::Migration[5.2]
  def change
    create_table :plastics do |t|
      t.string :name
      t.float :price_per_kg
      t.references :bank, foreign_key: true

      t.timestamps
    end
  end
end
