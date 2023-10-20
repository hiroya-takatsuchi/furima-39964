class PurchasesController < ApplicationController
  before_action :authenticate_user!,only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :redirect_if_sold, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @purchase_shipping_address = PurchaseShippingAddress.new
  end  
  
  
  def create
    @purchase_shipping_address = PurchaseShippingAddress.new(address_params)

    if @purchase_shipping_address.valid? 
      pay_item
      @purchase_shipping_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_if_sold
    redirect_to root_path if @item.purchase.present?
  end

  def address_params
    params.require(:purchase_shipping_address).permit(:post_code, :shipping_area_id, :city, :street, :building, :telephone).merge(item_id: @item.id, user_id: current_user.id, token: params[:token], price: @item.price)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: address_params[:price],  # 商品の値段
      card: address_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
