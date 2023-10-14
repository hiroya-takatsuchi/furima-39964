class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :image, presence: true
  validates :item, presence: true
  validates :explanation, presence: true
  validates :price, presence: true
  validates :price, format: { with: /\A([3-9][0-9]{2}|[1-9][0-9]{3,6}|10000000)\z/ }
  validates :price, numericality: { greater_than: 0 }
  validates :category, numericality: { other_than: 1 }
  validates :status, numericality: { other_than: 1 }
  validates :delivery_charge, numericality: { other_than: 1 }
  validates :shipping_area, numericality: { other_than: 1 }
  validates :shipping_day, numericality: { other_than: 1 }

  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :shipping_area
  belongs_to :shipping_day
  belongs_to :status
  has_one_attached :image
end