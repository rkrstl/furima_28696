class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_many :comments
  has_many_attached :images
  mount_uploader :image, ImagesUploader

extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to_active_hash :scheduled_delivery
belongs_to_active_hash :prefecture
belongs_to_active_hash :shipping_fee_status
belongs_to_active_hash :sales_status
belongs_to_active_hash :category



# 画像は1枚必須であること(ActiveStorageを使用すること)
  validates :images,presence:true
# - 商品名が必須であること
  validates :name,presence: true

# - 商品の説明が必須であること
  validates :text,presence: true

# - カテゴリーの情報が必須であること
  validates :category_id,presence: true,numericality: { other_than: 1 } 

# - 商品の状態についての情報が必須であること
  validates :sales_status_id,presence: true,numericality: { other_than: 1 } 

# - 配送料の負担についての情報が必須であること
  validates :shipping_fee_status_id,presence: true,numericality: { other_than: 1 } 

# - 発送元の地域についての情報が必須であること
  validates :prefecture_id,presence: true
# - 発送までの日数についての情報が必須であること
  validates :scheduled_delivery_id,presence: true,numericality: { other_than: 1 } 

# - 価格についての情報が必須であること
# 半角数字であること
# - 価格の範囲が、¥300~¥9,999,999の間であること
  validates :price,presence:true,format:{with:/\A[0-9]+\z/},numericality:{greater_than_or_equal_to:300,less_than_or_equal_to:999999}

end








