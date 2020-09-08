class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
  belongs_to :order

  # with_options presence: true do
  #   validates :postal_code
  #   validates :prefecture           numericality: { greater_than: 1 }
  #   validates :city
  #   validates :house_number
  #   validates :building_name
  #   validates :phone
end
