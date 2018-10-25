class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.text :name
      t.text :thumbnail
      t.bigint :price
      t.integer :inventory
      t.string :description
      t.boolean :enabled, default: false

      t.timestamps
    end
  end
end
