class Teacher < ActiveRecord::Base
	EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9._]+\.[A-Z]{2,4}$/i

	
	validates :firstname, :presence => true
	validates :address, :presence => true
	validates :lastname, :presence => true
	validates :phone_number, :presence => true
	validates :email, :presence=> true,:length=>{:maximum=>100}, :format=>EMAIL_REGEX,:confirmation=>true

end
