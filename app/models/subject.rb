class Subject < ActiveRecord::Base
	validates :subjectname, :presence=>true, :uniqueness=>true
	validates :subjectlevel, :presence=>true
end
