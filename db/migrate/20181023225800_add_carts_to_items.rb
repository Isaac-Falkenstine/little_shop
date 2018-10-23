class AddCartsToItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :carts, :items, foreign_key: true
  end
end
