require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入機能' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end
    it 'postal_codeが空だと保存できないこと' do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_address.postal_code = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid")
    end
    it 'prefectureを選択していないと保存できないこと' do
      @order_address.prefectures_id = 0
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefectures must be other than 0")    
    end
    it 'cityは空では保存できないこと' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberは空では保存できないこと' do
      @order_address.house_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("House number can't be blank")
    end
    it 'building_nameは空でも保存できること' do
      @order_address.building_name = nil
      expect(@order_address).to be_valid
    end
    it 'tokenが空だと保存できないこと' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'phone_numberが空だと保存できないこと' do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが10桁だと保存できないこと' do
      @order_address.phone_number = "1111111111"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_numberが12桁だと保存できないこと' do
      @order_address.phone_number = "111111111111"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end
  end
end
