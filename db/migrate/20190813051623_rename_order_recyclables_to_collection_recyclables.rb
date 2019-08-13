class RenameOrderRecyclablesToCollectionRecyclables < ActiveRecord::Migration[5.2]
  def change
    rename_table :order_recyclables, :collection_recyclables
  end
end
