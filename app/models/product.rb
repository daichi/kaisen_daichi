class Product < ActiveRecord::Base
  belongs_to :category  
  belongs_to :shop

  validates_presence_of :name, :description, :image_url
  validates_numericality_of :price, :greater_than => 0, :only_integer => true
  validates_format_of :image_url, :with => %r{\.(gif|jpg|png)\Z}i,
                      :message => "はGIF,JPG,PNG画像のURLでなければなりません"
  validates_uniqueness_of :name
  validate :price_must_be_a_multiple_of_hundreds
  
  scope :for_sale, :order => "created_at DESC"
  scope :name_like, lambda {|q| {:conditions => ['name like ?', "%#{q}%"]}}

  scope :recent, lambda {|num| {:limit => num, :order => "created_at DESC"}}
  
  scope :recommended, :conditions => {:recommended => true }  

  private
  def price_must_be_a_multiple_of_hundreds
    errors.add(:price, "must be a multiple of hundreds") unless price % 100 == 0
  end

  class User < ActiveRecord::Base
    scope :active, :condition => {:deleted => nil}
  end

  has_many :line_items
 # def category_name
 #   return category ? category.name : ""
 # end
end
