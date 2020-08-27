class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_many :comments
  has_one_attached :image




# 画像は1枚必須であること(ActiveStorageを使用すること)
# - 商品名が必須であること
  validates :name,presence: true
# - 商品の説明が必須であること
  validates :text,presence: true
# - カテゴリーの情報が必須であること
  validates :category,presence: true
# - 商品の状態についての情報が必須であること
  validates :sales_status,presence: true
# - 配送料の負担についての情報が必須であること
  validates :shipping_fee_status,presence: true
# - 発送元の地域についての情報が必須であること
  validates :prefecture_id,presence: true
# - 発送までの日数についての情報が必須であること
   validates :scheduled_delivery_id

# - 価格についての情報が必須であること
　　#半角数字であること
  validates :price,presence:true,format:{with:/\A[0-9]+\z/}
  
# - 価格の範囲が、¥300~¥9,999,999の間であること
 
  
end








