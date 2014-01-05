class Book < ActiveRecord::Base
  attr_accessible :author, :desc, :image, :price, :rate, :title
  validates :title, presence:true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
end
