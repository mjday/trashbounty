class RemoveDatesFromBanks < ActiveRecord::Migration[5.2]
  def change
    remove_column :banks, :date, :date
  end
end
