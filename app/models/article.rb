class Article < ActiveRecord::Base
  attr_accessible :body, :category_id, :image, :title, :excerpt
  has_many :comments
  validates :title, presence:true, length: { maximum: 150 }, uniqueness: { case_sensitive: false }
  simple_search :title, :body
end
