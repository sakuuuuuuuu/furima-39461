class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :name_last, presence: true ,format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
         validates :name_first, presence: true,format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
         validates :name_last_kana, presence: true,format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
         validates :name_first_kana, presence: true,format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
         validates :birth_day, presence: true
         validates :password, format:{ with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i }



          # email と  password はデバイスで生成されてるからバリデーション記述する必要なし
  end


#   |nickname           |string |null: false|
# |email              |string |null: false  unique: true|
# |encrypted_password |string | null: false |
# |name_last          |string | null: false |
# |name_first         |string | null: false |
# |name_last_kana     |string | null: false |
# |name_first_kana    |string | null: false |
# |birth_day         |date | null: false |