class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ZENKAKU = /\A[ぁ-んァ-ン一-龥]/
  ZENKAKU_KANA = /\A[ァ-ヶー－]+\z/
  
  validates :nickname, presence: true
  validates :family_name, presence: true, format: { with: ZENKAKU }
  validates :first_name, presence: true, format: { with: ZENKAKU }
  validates :family_name_kana, presence: true, format: { with: ZENKAKU_KANA }
  validates :first_name_kana, presence: true, format: { with: ZENKAKU_KANA }
  validates :birth_day, presence: true
  validates :password, format: { with: /\A[a-z0-9]+\z/i }
  validates :email, uniqueness: true
end
