class DeliverAddress < ApplicationRecord
belongs_to :order
  

validates :prefecture,presence: true

# 郵便番号にはハイフンが必要であること（123-4567となる）
# - 電話番号にはハイフンは不要で、11桁以内であること
validates :postal_code,presence: true,format: {with: /\A[0-9]{3}-[0-9]{4}\z/},numericality:{maximum:11}
validates :city,presence: true
validates :address1,presence: true
validates :address2
validates :telephone,presence: true




end
