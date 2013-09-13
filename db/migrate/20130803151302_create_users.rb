class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :phone_number
      t.string :username
      t.string :hashed_password
      t.string :salt
      t.integer "role_id"

      t.timestamps
    end
  end
end
