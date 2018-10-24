class CreateState < ActiveRecord::Migration[5.1]
  def change
    create_table :states do |t|
      t.string :name
      t.string :abbr
      t.integer :user_id
    end
  end
end
