class OrderAddress

  include ActiveModel::Model
  attr_accessor :prefectures_id, :postal_code, :city, :house_number, :building_name, :phone_number,:item_id,:user_id, :token

  with_options presence: true do
    validates :prefectures_id
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :house_number   
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    validates :token

    with_options numericality: { other_than: 0 } do
      validates :prefectures_id
    end
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(prefectures_id: prefectures_id, postal_code: postal_code, city: city,house_number: house_number,building_name: building_name,phone_number: phone_number,order_id: order.id)
  end
end
