require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  it 'name、explanation、price、category_id、status_id、delivery_charge_id、shipment_source_id、shipping_days_idが存在すれば登録できること' do
    expect(@item).to be_valid
  end

  it '商品画像を1枚つけることが必須であること' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end

  it '商品名が必須であること' do
    @item.name = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Name can't be blank")
  end

  it '商品の説明が必須であること' do
    @item.explanation = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Explanation can't be blank")
  end

  it 'カテゴリーの情報が必須であること' do
    @item.category_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank")
  end

  it 'カテゴリーのid情報が0の場合出品できないこと' do
    @item.category_id = 0
    @item.valid?
    expect(@item.errors.full_messages).to include("Category must be other than 0")
  end

  it '商品の状態についての情報が必須であること' do
    @item.status_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Status can't be blank")
  end

  it '商品状態のid情報が0の場合出品できないこと' do
    @item.status_id = 0
    @item.valid?
    expect(@item.errors.full_messages).to include("Status must be other than 0")
  end

  it '配送料の負担についての情報が必須であること' do
    @item.delivery_charge_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
  end

  it '配送料の負担のid情報が0の場合出品できないこと' do
    @item.delivery_charge_id = 0
    @item.valid?
    expect(@item.errors.full_messages).to include("Delivery charge must be other than 0")
  end

  it '発送元の地域についての情報が必須であること' do
    @item.shipment_source_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipment source can't be blank")
  end

  it '発送元の地域のid情報が0の場合出品できないこと' do
    @item.shipment_source_id = 0
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipment source must be other than 0")
  end

  it '発送までの日数についての情報が必須であること' do
    @item.shipping_days_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping days can't be blank")
  end

  it '発送までの日数のid情報が0の場合出品できないこと' do
    @item.shipping_days_id = 0
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping days must be other than 0")
  end

  it '価格についての情報が必須であること' do
    @item.price = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
  end

  it '価格が、¥299以下だと保存できないこと' do
    @item.price = 200
    @item.valid?
    expect(@item.errors.full_messages).to include('Price is not included in the list')
  end

  it '価格が、¥10,000,000以上だと保存できないこと' do
    @item.price = 10_000_000
    @item.valid?
    expect(@item.errors.full_messages).to include('Price is not included in the list')
  end

  it '販売価格は半角数字のみ保存可能であること' do
    @item.price = '３０００'
    @item.valid?
    expect(@item.errors.full_messages).to include('Price is not included in the list')
  end
end
