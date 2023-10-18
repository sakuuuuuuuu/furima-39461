class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  belongs_to :condition_id
  belongs_to :del_fee_id
  belongs_to :prefecture_id
  belongs_to :days_until_shipping_id


  has_one :purchase_record
  belongs_to :user


  validates :name, presence: true
  validates :explaination, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :del_fee_id, presence: true
  validates :prefecture_id, presence: true
  validates :days_until_shipping_id, presence: true
  validates :price, presence: true
  validates :user, presence: true
  
end
