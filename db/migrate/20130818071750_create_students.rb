class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
    	t.string :firstname    	
    	t.string :lastname
    	t.string :student_number
    	t.string :parent_name
    	t.string :phone_number
    	t.string :address
    	t.string :student_school
    	t.string :student_class
      t.timestamps
    end
  end
end
