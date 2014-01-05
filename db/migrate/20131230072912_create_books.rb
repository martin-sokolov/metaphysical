class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :image
      t.float :price
      t.text :desc
      t.float :rate

      t.timestamps
    end
  end
end
