class CreateLocation < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :city
      t.integer :state_id
      t.integer :zip
    end
  end
end
