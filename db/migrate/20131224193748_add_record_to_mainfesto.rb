class AddRecordToMainfesto < ActiveRecord::Migration
  def change
    Manifesto.create(:pageid => 1,:pagecontent => "Sample Content1")
    Manifesto.create(:pageid => 2,:pagecontent => "Sample Content2")
  end
end
