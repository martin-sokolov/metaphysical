class Program < ActiveRecord::Base
  attr_accessible :desc, :excerpt, :image, :title, :videoids
  validates :title, presence:true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
end