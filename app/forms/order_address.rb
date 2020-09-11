class OrderAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone, :order_id, :item_id, :user_id, :token
  
  with_options presence: true do
    validates :token
    validates :postal_code,        format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id,      numericality: { greater_than: 1 }
    validates :city
    validates :house_number
    validates :phone,              format: { with: /\A\d{10,11}\z/ }
  end

  def save
    # オーダーの情報を保存し、「order」という変数に入れている
    order = Order.create(item_id: item_id, user_id: user_id)
    # 住所の情報を保存
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, phone: phone, building_name: building_name, order_id: order.id)
  end
end