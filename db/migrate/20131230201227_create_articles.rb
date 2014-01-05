class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :image
      t.text :body
      t.integer :category_id

      t.timestamps
    end
  end
end
