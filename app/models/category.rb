class Category < ActiveRecord::Base
  attr_accessible :color, :parent, :title
  before_save {self.parent = 0 unless self.parent}
  validates :title, presence:true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
end
