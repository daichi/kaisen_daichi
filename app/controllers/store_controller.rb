class StoreController < ApplicationController
  def index
    #@cart = current_cart
    @products = Product.for_sale.paginate :page => params[:page], :per_page => 2   
  end
end
