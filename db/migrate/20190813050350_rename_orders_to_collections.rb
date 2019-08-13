class RenameOrdersToCollections < ActiveRecord::Migration[5.2]
  def change
    rename_table :orders, :collections
  end
end
