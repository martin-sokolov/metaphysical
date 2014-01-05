class AddExcerptToArticle < ActiveRecord::Migration
  def change
    add_column :articles,:excerpt,:string
  end
end
