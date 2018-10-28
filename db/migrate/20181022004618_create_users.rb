class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :street_address
      t.string :email_address
      t.string :password_digest
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
