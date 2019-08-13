class ChangeForeignKeyforReviews < ActiveRecord::Migration[5.2]
  def change
    rename_column :reviews, :order_id, :collection_id
  end
end
