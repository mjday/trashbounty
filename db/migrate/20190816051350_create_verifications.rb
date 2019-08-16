class CreateVerifications < ActiveRecord::Migration[5.2]
  def change
    create_table :verifications do |t|
      t.float :total_amount
      t.float :total_kg
      t.date :date

      t.timestamps
    end
  end
end
