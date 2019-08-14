class AddCoordinatesToBanks < ActiveRecord::Migration[5.2]
  def change
    add_column :banks, :latitude, :float
    add_column :banks, :longitude, :float
  end
end
