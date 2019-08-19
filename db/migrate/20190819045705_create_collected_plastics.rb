class CreateCollectedPlastics < ActiveRecord::Migration[5.2]
  def change
    create_table :collected_plastics do |t|
      t.float :kg_collected
      t.references :plastic, foreign_key: true
      t.references :verification, foreign_key: true

      t.timestamps
    end
  end
end
