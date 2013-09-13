class User < ActiveRecord::Base
	require 'digest/sha2'
	
	EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9._]+\.[A-Z]{2,4}$/i

	validates :username, :presence => true , :uniqueness => true
	validates :firstname, :presence => true
	validates :lastname, :presence => true
	validates :phone_number, :presence => true
	validates :password, :confirmation => true
	validates :email, :presence=> true,:length=>{:maximum=>100}, :format=>EMAIL_REGEX,:confirmation=>true

	attr_accessor :password_confirmation
	attr_reader :password

	validate :password_must_be_present

	def User.authenticate(username, password)
		if user = find_by_username(username)
			if user.hashed_password == encrypt_password(password, user.salt)
				user
			end
		end
	end

	def User.encrypt_password(password, salt)
		Digest::SHA2.hexdigest(password + "wibble" + salt)
	end

	def password=(password)
		@password = password
		if password.present?
			generate_salt
			self.hashed_password = self.class.encrypt_password(password, salt)
		end	
	end	

	private

	def password_must_be_present
		errors.add(:password, "Missing Password") unless hashed_password.present?
	end

	def generate_salt
		self.salt = self.object_id.to_s + rand.to_s
	end
end
