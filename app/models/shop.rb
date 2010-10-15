class Shop < ActiveRecord::Base
  validates_presence_of :name, :description, :lines_summary
  validates_format_of :image_url, :with => %r{\.(gif|jpg|png)$}i,
 		      :message => "はGIF,JPG,PNG画像でなければなりません"
  validates_uniqueness_of :name
end
