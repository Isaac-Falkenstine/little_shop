class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.integer :item_id
      t.integer :order_id
      t.integer :user_id
      t.integer  :count
      t.integer :subtotal
      t.timestamps
    end
  end
end
