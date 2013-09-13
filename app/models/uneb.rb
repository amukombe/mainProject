class Uneb < ActiveRecord::Base
	
	#has_attached_file :app
	attr_accessor :app

	validates :subject, :presence=>true
	#validates_attachment_presence :app
	#validates_attachment_content_type :app, :content_type => ['file/pdf', 'file/docx']

	def self.save(upload)
		name1 =  upload['datafile'].original_filename
		directory = "assets/unebpapers"
		# create the file path
		path = File.join(directory, name1)
		# write the file
		File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
	end
end
