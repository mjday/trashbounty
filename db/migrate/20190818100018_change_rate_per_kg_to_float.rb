class ChangeRatePerKgToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :banks, :rate_per_kg, :float
  end
end
