class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :total
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
