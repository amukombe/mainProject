class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string "first_name", :limit => 25
	  t.string "last_name", :limit => 50
	  t.string "username", :limit => 25
	  t.string "email", :limit => 100, :null => false
	  t.string "hashed_password", :limit => 40
	  t.string "salt", :limit => 40
      t.timestamps
    end
  end
end
