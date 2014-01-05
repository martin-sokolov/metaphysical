module BooksHelper
  def eval_rates(book_id)
    sum = Rating.sum(:value, :conditions => "book_id = #{book_id}")
    cnt = count_rates(book_id)
    if cnt > 0
      avg =sum/cnt
    else
      avg = 0
    end
    return avg
  end
  def count_rates(book_id)
    return Rating.count(:value, :conditions => "book_id = #{book_id}")
  end
end
