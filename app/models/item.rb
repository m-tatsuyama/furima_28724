class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :charge
  belongs_to_active_hash :location
  belongs_to_active_hash :shipping
  
  has_one_attached :image
  has_one :order
  has_many :comments
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :image
    validates :text
    validates :category_id
    validates :item_status_id
    validates :charge_id
    validates :location_id
    validates :shipping_id
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end
end
