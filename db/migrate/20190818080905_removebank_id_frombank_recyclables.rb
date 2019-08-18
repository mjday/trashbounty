class RemovebankIdFrombankRecyclables < ActiveRecord::Migration[5.2]
  def change
    remove_column :bank_recyclables, :bank, index: true, foreign_key: true
  end
end
