class Item < ApplicationRecord
  validates :item, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :shipping_area_id, presence: true
  validates :shipping_day_id, presence: true
  validates :price, presence: true
end
