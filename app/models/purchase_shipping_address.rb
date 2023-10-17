class PurchaseShippingAddress
  include ActiveModel::Model
  attr_accessor :post_code, :shipping_area_id, :city, :street, :building, :telephone, :purchase_id, :user_id, :item_id

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :street
    validates :telephone, format: { with: /\A\d{10,11}\z/, message: "of digits is incorrect" }
    validates :telephone, format: { with: /\A\d+\z/, message: "is invalid. Input only number" }

  end
  validates :shipping_area_id, numericality: {other_than: 0, message: "can't be blank"}
end