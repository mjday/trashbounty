class CreateBankRecyclables < ActiveRecord::Migration[5.2]
  def change
    create_table :bank_recyclables do |t|
      t.float :rate_per_kg
      t.references :bank, foreign_key: true
      t.references :recyclable, foreign_key: true

      t.timestamps
    end
  end
end
