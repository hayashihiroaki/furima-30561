class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :shipping_days
  belongs_to_active_hash :shipment_source
  belongs_to_active_hash :status

  with_options presence: true do
    validates :name
    validates :explanation
    validates :price
    validates :category
    validates :status
    validates :delivery_charge
    validates :shipment_source
    validates :shipping_days
    validates :image
  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :delivery_charge_id
    validates :shipment_source_id
    validates :shipping_days_id
  end
  
  belongs_to :user
  has_one_attached :image
end
