class ManageMigration < ActiveRecord::Migration
  def up
  	add_column :teachers, :role_id, :string
  	add_column :students, :role_id,:string
  end

  def down
  	remove_column :students, :role_id
  	remove_column :teachers, :role_id
  end
end
