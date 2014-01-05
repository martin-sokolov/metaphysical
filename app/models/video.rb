class Video < ActiveRecord::Base
  attr_accessible :pay, :title, :url, :thumb
  before_save {
      self.pay = !self.url.include?("youtube")
      if !self.pay?
        temp_url = self.url;
        youtube_id = temp_url.sub "http://www.youtube.com/watch?v=", ""
        self.thumb = "http://img.youtube.com/vi/#{youtube_id}/default.jpg"
        self.url = self.url.sub "http://www.youtube.com/watch?v=", "http://www.youtube.com/embed/"
      end
  }
  validates :title, presence:true, length: { maximum: 255 }
end
