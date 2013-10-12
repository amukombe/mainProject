class CreateAcounts < ActiveRecord::Migration
  def change
    create_table :acounts do |t|
    	t.string :general_no
    	t.integer :school_id
    	t.string :username
    	t.string :hashed_password
    	t.string :salt
    	t.string :role_id
      t.timestamps
    end
  end
end
