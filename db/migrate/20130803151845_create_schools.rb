class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :schoolname
      t.string :address
      t.string :headteacher
      t.string :contact
      t.string :user

      t.timestamps
    end
  end
end
