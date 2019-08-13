class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.date :date
      t.float :total_kg
      t.float :total_amount
      t.string :payment_type
      t.references :user, foreign_key: true
      t.references :bank, foreign_key: true

      t.timestamps
    end
  end
end
