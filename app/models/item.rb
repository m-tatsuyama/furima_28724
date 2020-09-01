class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :charge
  belongs_to_active_hash :location
  belongs_to_active_hash :shipping

  has_one :order
  has_many :comments
  belongs_to :user
  has_one_attached :image

  validates :category_id, :items_status_id, :charge_id, :location_id, :shipping_id, numericality: { other_than: 1 }

  with_options presence: true do
    validates :name
    validates :image
    validates :text
    validates :category
    validates :items_status
    validates :charge
    validates :location
    validates :shipping
    validates :price, format: {with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
end
