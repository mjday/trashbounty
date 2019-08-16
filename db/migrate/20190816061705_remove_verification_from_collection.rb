class RemoveVerificationFromCollection < ActiveRecord::Migration[5.2]
  def change
    remove_column :collections, :verification_id, :bigint
  end
end
