class Item < ApplicationRecord
  has_one :order
  has_many :comments
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :image
    validates :text
    validates :categoly
    validates :items_status
    validates :charge
    validates :location
    validates :shipping
    validates :price
  end
end
