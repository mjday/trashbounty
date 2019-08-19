class AddRateToBanks < ActiveRecord::Migration[5.2]
  def change
    add_column :banks, :rate_per_kg, :integer
  end
end
