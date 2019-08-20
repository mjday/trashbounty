class AddCollectionToVerifications < ActiveRecord::Migration[5.2]
  def change
    add_reference :verifications, :collection, foreign_key: true
  end
end
