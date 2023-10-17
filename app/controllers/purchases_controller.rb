class PurchasesController < ApplicationController
  before_action :authenticate_user!,only: [:index, :create]
  
  def index
    @purchase_shippingaddress = PurchaseShippingAddress.new

  end  
  
  
  def create
    @purchase = Purchase.new(purchase_params)
    @address = ShippingAddress.new(address_params)

    if @purchase.valid? && @address.valid?
      ActiveRecord::Base.transaction do
        @purchase.save!
        @address.save!
      end
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.permit(:price).merge(user_id: current_user.id)
  end

  def address_params
    params.permit(:post_code, :shipping_area, :city, :street, :building, :telephone).merge(purchase_id: @purchase.id)
  end

end
