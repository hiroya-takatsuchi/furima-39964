class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end
  
  def create
    Item.create(item_params)
    redirect_to '/'
  end

  private
  def item_params
    params.require(:item).permit(:image, :item, :explanation, :price, :category_id, :status_id, :delivery_charge_id, :shipping_area_id, :shipping_day_id).merge(user_id: current_user.id)
  end
end  
