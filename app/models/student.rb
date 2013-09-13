class Student < ActiveRecord::Base
	validates :firstname, :lastname, :parent_name, :phone_number, :address, :presence=>true
	validates :student_number, :presence=>true, :uniqueness=>true
	validates :student_school, :student_class, :presence=>true
end
