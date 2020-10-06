class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  ZENKAKU = /\A[ぁ-んァ-ン一-龥]/.freeze
  ZENKAKU_KANA = /\A[ァ-ヶー－]+\z/.freeze

  with_options presence: true do
    validates :nickname
    validates :family_name, format: { with: ZENKAKU }
    validates :first_name, format: { with: ZENKAKU }
    validates :family_name_kana, format: { with: ZENKAKU_KANA }
    validates :first_name_kana, format: { with: ZENKAKU_KANA }
    validates :birth_day
  end
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :email, uniqueness: true
end
