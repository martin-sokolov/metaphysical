class AddVideoidsToProgram < ActiveRecord::Migration
  def change
    add_column :programs,:videoids,:string
  end
end
