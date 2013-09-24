class ManageUser < ActiveRecord::Migration
  def up
  	change_column :users, :role_id, :string
  end

  def down
  	change_column :users, :role_id, :string
  end
end
