class Faq < ActiveRecord::Base
  attr_accessible :answer, :quiz
  validates :quiz, presence:true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }

end
