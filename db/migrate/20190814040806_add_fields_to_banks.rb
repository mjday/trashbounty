class AddFieldsToBanks < ActiveRecord::Migration[5.2]
  def change
    add_column :banks, :phone_number, :string
    add_column :banks, :website, :string
    add_column :banks, :country, :string
    add_column :banks, :materials_accepted, :string
    add_column :banks, :products_accepted, :string
  end
end
