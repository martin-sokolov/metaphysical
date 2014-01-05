class Audio < ActiveRecord::Base
  attr_accessible :author, :title, :url
  validates :title, presence: true, length: { maximum: 150 }, uniqueness: { case_sensitive: false }
end
