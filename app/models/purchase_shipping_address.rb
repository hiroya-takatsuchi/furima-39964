class PurchaseShippingAddress
  include ActiveModel::Model
  attr_accessor :post_code, :shipping_area_id, :city, :street, :building, :telephone, :user_id, :item_id, :purchase_id, :token, :price
  

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :street
    validates :user_id
    validates :item_id
    validates :token, presence: true
    validates :telephone, format: { with: /\A\d{10,11}\z/, message: "of digits is incorrect" }
  end
  validates :telephone, format: { with: /\A\d+\z/, message: "is invalid. Input only number" }
  validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }
  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
  
    ShippingAddress.create(post_code: post_code, shipping_area_id: shipping_area_id, city: city, street: street, building: building, purchase_id: purchase.id, telephone: telephone)
  end
end