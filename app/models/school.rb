class School < ActiveRecord::Base
	has_many :subscriber

	validates :schoolname, :presence=>true, :uniqueness=>true
	validates :address, :presence=>true
	validates :headteacher, :presence=>true
end
