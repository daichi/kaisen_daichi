class StoreController < ApplicationController
before_filter :set_cart

  def index
    @products = Product.for_sale.paginate :page => params[:page], :per_page => 3
  end

  def add_to_cart
    @product = Product.find(params[:id])
    @cart.add_product(@product)
    #redirect_to store_path :notice => "#{@product.name}が買い物カゴに追加されました"
    respond_to do |format|
      format.js
    end
  end

  def empty_cart
    @cart.empty!
    respond_to do |format|
      format.js
    end
  end 
  
  def remove_item_from_cart
    product = Product.find(params[:id])
    # ここにカートからカートアイテムを削除する処理を記述
    @cart.remove_product(product)
    respond_to do |format|
      format.js
    end
  end

  private
  def current_cart
    session[:cart] ||= Cart.new
  end

  def set_cart
    @cart = current_cart
  end
end
