class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
    	t.integer :user_id
    	t.string :title
    	t.text :synopsis, :limit=>1000
    	t.text :body, :limit=>2000
    	t.boolean :published, :value=>false
    	t.datetime :published_at
    	t.integer :category_id
      t.timestamps
    end
  end
end
