class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :title
      t.string :description
      t.timestamps
    end
    add_index :roles, :title, :unique => true
  end
end
