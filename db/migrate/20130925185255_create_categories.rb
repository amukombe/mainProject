class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
    	t.string :name

      t.timestamps
    end
    change_column :articles, :published, :boolean,:default=>false
    news_category=Category.create(:name=>'Site News')
    change_column :articles, :category_id, :integer, :default=> news_category
  end
  def self.down
  	change_column :articles, :category_id, :integer, :default=> news_category
  	change_column :articles, :published, :boolean,:default=>false
  	drop_table :categories
  end
end
