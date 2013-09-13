class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :subjectname
      t.string :subjectcode
      t.string :subjectlevel

      t.timestamps
    end
  end
end
