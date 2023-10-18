class days_until_shipping_id < ActiveHash::Base

include ActiveHash::Associations
  belongs_to :item

end
