class AddVerificationReferenceToCollections < ActiveRecord::Migration[5.2]
  def change
    add_reference :collections, :verification, foreign_key: true
  end
end
