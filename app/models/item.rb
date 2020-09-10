class Item < ApplicationRecord
  has_one :item_order
  belongs_to :user
end
