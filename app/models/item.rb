class Item < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :image, presence: true
  validates :item, presence: true
  validates :explanation, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999,  message: "is out of setting range" }
  validates :price, numericality: { only_integer: true, message: "is invalid. Input half-width characters" }
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :status_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :shipping_day_id, numericality: { other_than: 1, message: "can't be blank" } 

  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :shipping_area
  belongs_to :shipping_day
  has_one_attached :image
end