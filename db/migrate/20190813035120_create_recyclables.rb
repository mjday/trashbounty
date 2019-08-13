class CreateRecyclables < ActiveRecord::Migration[5.2]
  def change
    create_table :recyclables do |t|
      t.string :name

      t.timestamps
    end
  end
end
