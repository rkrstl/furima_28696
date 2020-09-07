class UserOrder

  include ActiveModel::Model
  attr_accessor :token,:name, :user_id, :item_id, :postal_code, :prefecture_id, :city, :address1,:address2,:telephone

  validates :prefecture_id,presence: true
  # 郵便番号にはハイフンが必要であること（123-4567となる）
  validates :postal_code,presence: true,format:{with: /\A\d{3}[-]\d{4}\z/}
  validates :city,presence: true
  validates :address1,presence: true
  #電話番号にはハイフンは不要で、11桁以内であること
  validates :telephone,presence: true,format:{ with:/\A\d{11}\z/}

  def save
    order = Order.create(user_id:user_id,item_id:item_id)
    DeliverAddress.create(order_id: order.id,prefecture_id: prefecture_id,postal_code: postal_code,city: city,address1: address1,address2:address2,telephone: telephone)
    
    
  end

end


  