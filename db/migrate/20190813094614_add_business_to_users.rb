class AddBusinessToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :business, :boolean, default: false
  end
end
