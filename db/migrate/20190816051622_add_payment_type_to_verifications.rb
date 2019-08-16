class AddPaymentTypeToVerifications < ActiveRecord::Migration[5.2]
  def change
    add_column :verifications, :payment_type, :string
  end
end
