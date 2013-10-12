class Account < ActiveRecord::Base
	has_many :students

	validates :student_no, :uniqueness=>true,:presence=>true
	validates :school_name, :presence=>true
	validates :username, :uniqueness=>true, :presence=>true
	validates :password, :confirmation => true
	attr_accessor :password_confirmation
	attr_reader :password

	validate :password_must_be_present

	def Account.authenticate(username, password)
		if account = find_by_username(username)
			if account.hashed_password == encrypt_password(password, account.salt)
				account
			end
		end
	end
	
	def Account.encrypt_password(password, salt)
		Digest::SHA2.hexdigest(password + "wibble" + salt)
	end

	def password=(password)
		@password = password
		if password.present?
			generate_salt
			self.hashed_password = self.class.encrypt_password(password, salt)
		end	
	end	

	def Student.validate_student(student_number, student_school)
		if student = Student.find_by_student_number(student_number)
			student
		else
			return false
		end
	end
	#private methods
	private

	def password_must_be_present
		errors.add(:password, "Missing Password") unless hashed_password.present?
	end

	def generate_salt
		self.salt = self.object_id.to_s + rand.to_s
	end
end
