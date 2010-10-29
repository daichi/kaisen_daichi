class StoreController < ApplicationController
  def index
    #@cart = current_cart
    @products = Product.for_sale.paginate :page => params[:page], :per_page => 5
  end

  def add_to_cart
    @product = Product.find(params[:id])
    @cart = current_cart
    @cart.add_product(@product)
    flash[:notice] = "#{@product.name}が買い物カゴに追加されました"
  end

  def empty_cart
    session[:cart] = nil
    redirect_to store_path, :notice => "カートは現在空です"
  end 
  
  def remove_item_from_cart
    product = Product.find(params[:id])
    @cart = current_cart

    # ここにカートからカートアイテムを削除する処理を記述
    @cart.remove_product(product)

    redirect_to store_path, :notice => "#{product.name}を買い物カゴから削除しました"
  end

  private
  def current_cart
    session[:cart] ||= Cart.new
  end
end
