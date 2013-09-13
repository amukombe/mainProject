class CreateUnebs < ActiveRecord::Migration
  def change
    create_table :unebs do |t|
      t.date :academic_year
      t.string :subject
      t.string :academic_level
      t.string :app_file_name
      t.integer :app_file_size
      t.string :app_content_type

      t.timestamps
    end
  end
end
