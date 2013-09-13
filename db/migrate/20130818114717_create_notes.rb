class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.string :subject
      t.string :academic_class
      t.string :app_file_name
      t.integer :app_file_size
      t.string :app_content_type

      t.timestamps
    end
  end
end
