class Rating < ActiveRecord::Base
  attr_accessible :book_id, :user_id, :value
end
