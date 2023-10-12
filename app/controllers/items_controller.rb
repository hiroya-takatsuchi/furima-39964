class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end
  
  def create
    items = Items.all
    redirect_to '/'
  end

  

end
