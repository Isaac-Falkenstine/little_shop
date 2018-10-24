class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :street_address
      t.string :email_address
      t.string :password_digest
      t.string :role
      t.string :city
      t.integer :zip
      t.integer :state_id

      t.timestamps
    end
  end
end
