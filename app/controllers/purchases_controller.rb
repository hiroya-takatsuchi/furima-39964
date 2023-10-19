class PurchasesController < ApplicationController
  before_action :authenticate_user!,only: [:index, :create]
  
  def index
    @item = Item.find(params[:item_id])
    @purchase_shipping_address = PurchaseShippingAddress.new

  end  
  
  
  def create
    @item =Item.find(params[:item_id])
    @purchase_shipping_address = PurchaseShippingAddress.new(address_params)

    if @purchase_shipping_address.valid? 
      pay_item
      @purchase_shipping_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def address_params
    params.require(:purchase_shipping_address).permit(:post_code, :shipping_area_id, :city, :street, :building, :telephone).merge(item_id: @item.id, user_id: current_user.id, token: params[:token], price: @item.price)
  end

  def pay_item
    Payjp.api_key = "sk_test_3414ffd90bd50f43ab723bb7"  
    Payjp::Charge.create(
      amount: address_params[:price],  # 商品の値段
      card: address_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
