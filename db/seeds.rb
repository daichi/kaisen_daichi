# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


#["魚","肉","野菜","スイーツ"].each do |category_name|
#  Category.create!(:name => category_name) unless Category.find_by_name(category_name)
#end

Product.all.each do |product|
    product.update_attribute(:shop_id, Shop.all.shuffle.first.id)
end
