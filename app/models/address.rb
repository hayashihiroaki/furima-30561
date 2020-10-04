class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefectures

  with_options presence: true do
    validates :prefectures
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :house_number   
    validates :phone_number, format: { with: /\A\d{11}\z/ }

    with_options numericality: { other_than: 0 } do
      validates :prefectures_id
    end
  end

  belongs_to :order
end
