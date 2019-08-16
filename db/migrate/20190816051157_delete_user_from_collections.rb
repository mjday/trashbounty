class DeleteUserFromCollections < ActiveRecord::Migration[5.2]
  def change
    remove_column :collections, :user_id, :bigint
  end
end
