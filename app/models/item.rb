class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  belongs_to :condition_id
  belongs_to :del_fee_id
  belongs_to :prefecture_id
  belongs_to :days_until_shipping_id

  
  has_one :purchase_record
  belongs_to :user
end
