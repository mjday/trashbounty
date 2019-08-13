class ChangeForeignKeyforCollectionRecyclables < ActiveRecord::Migration[5.2]
  def change
    rename_column :collection_recyclables, :order_id, :collection_id
  end
end
