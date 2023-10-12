class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end
  
  def create
    Items.create(item_params)
    redirect_to '/'
  end

  private
  def tweet_params
    params.require(:item).permit(:name, :image, :text)
  end

end
