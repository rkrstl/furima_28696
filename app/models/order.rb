class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :delivery_address
end
