class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.string :color
      t.integer :parent

      t.timestamps
    end
  end
end
