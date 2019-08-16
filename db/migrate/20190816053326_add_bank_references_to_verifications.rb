class AddBankReferencesToVerifications < ActiveRecord::Migration[5.2]
  def change
    add_reference :verifications, :bank, foreign_key: true
  end
end
