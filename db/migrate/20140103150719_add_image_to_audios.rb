class AddImageToAudios < ActiveRecord::Migration
  def change
    add_column :audios,:image,:string
  end
end
