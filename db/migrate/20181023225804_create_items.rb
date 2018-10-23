class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.text :name
      t.text :thumbnail
      t.float :price
      t.integer :count
      t.string :description
      

      t.timestamps
    end
  end
end
