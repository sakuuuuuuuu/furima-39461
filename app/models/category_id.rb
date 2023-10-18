class category_id < ActiveHash::Base

include ActiveHash::Associations
  belongs_to :item

end

