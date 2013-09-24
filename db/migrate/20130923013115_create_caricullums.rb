class CreateCaricullums < ActiveRecord::Migration
  def change
    create_table :caricullums do |t|
    	t.string :caricullumname
    	t.string :description
      t.timestamps
    end
  end
end
