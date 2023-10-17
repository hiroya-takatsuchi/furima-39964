class ShippingAddress < ApplicationRecord
  
  validates :post_code, presence: true
  validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :city, presence: true
  validates :street, presence: true
  validates :telephone, presence: true
  validates :purchase, presence: true
  
  belongs_to :purchase
end
