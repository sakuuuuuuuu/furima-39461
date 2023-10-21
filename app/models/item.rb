class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  # , class_name: 'Category'
  belongs_to :condition
  # , class_name: 'Condition'
  belongs_to :del_fee
  belongs_to :Prefecture
  # , class_name: 'Prefecture'
  belongs_to :days_until_shipping




  has_one :purchase_record
  belongs_to :user
  has_one_attached :image


  validates :name, presence: true
  validates :explaination, presence: true

  #下記の選択が「---」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :del_fee_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :days_until_shipping_id, numericality: { other_than: 1, message: "can't be blank"} 
  

  # validates :category_id, presence: true
  # validates :condition_id, presence: true
  # validates :del_fee_id, presence: true
  # validates :prefecture_id, presence: true
  # validates :days_until_shipping_id, presence: true
  validates :price, presence: true
  # validates :user, presence: true
  
end
