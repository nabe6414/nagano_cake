class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:update_item] = "新しい商品が追加されました"
      redirect_to admin_items_path
    else
      @genres = Genre.all
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:update_item] = "商品情報が更新されました"
      redirect_to admin_items_path
    else
      @genres = Genre.all
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :genre_id, :price, :is_active, :image)
  end
end
