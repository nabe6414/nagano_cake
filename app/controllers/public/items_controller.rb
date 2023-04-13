class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @items = Item.search(params[:search])
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end

  def item_params
    params.require(:item).permit(:search)
  end
end
