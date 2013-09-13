class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.integer "school_id"
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :phone_number
      t.string :address
      t.string :school
      t.string :subject

      t.timestamps
    end
    add_index(:teachers, :school_id)
    add_index(:teachers, :subject)
  end
end
