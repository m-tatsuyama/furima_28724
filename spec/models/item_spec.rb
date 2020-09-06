require 'rails_helper'
RSpec.describe Item, type: :model do
  describe '商品出品登録の保存' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@item).to be_valid
    end
    it 'imageが空だと登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'nameが空では登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'textが空では登録できない' do
      @item.text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end
    it 'categoryが空では登録できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'categoryが1では登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be greater than 1')
    end
    it 'item_statusが空では登録できない' do
      @item.item_status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item status can't be blank")
    end
    it 'item_statusが1では登録できない' do
      @item.item_status_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Item status must be greater than 1')
    end
    it 'chargeが空では登録できない' do
      @item.charge_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Charge can't be blank")
    end
    it 'chargeが1では登録できない' do
      @item.charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Charge must be greater than 1')
    end
    it 'locationが空では登録できない' do
      @item.location_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Location can't be blank")
    end
    it 'locationが1では登録できない' do
      @item.location_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Location must be greater than 1')
    end
    it 'shippingが空では登録できない' do
      @item.shipping_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping can't be blank")
    end
    it 'shippingが1では登録できない' do
      @item.shipping_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping must be greater than 1')
    end
    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが半角数字のみでなければ登録できない' do
      @item.price = '１２３４'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
    it 'priceが¥300~でなければ登録できない' do
      @item.price = '10'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it 'priceが~¥9,999,999でなければ登録できない' do
      @item.price = '100000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
  end
end
