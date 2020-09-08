class DeliverAddressesController < ApplicationController
  before_action :set_item,only:[:index,:create]
  before_action :move_to_login,only:[:index]
  before_action :move_to_indexx,only:[:index]

  def index
    @order = UserOrder.new
  end


  def create
    @order = UserOrder.new(delivery_params)
    if @order.valid?
      pay_item
      @order.save  # バリデーションをクリアした時
     redirect_to root_path
    else
      render "index"    # バリデーションに弾かれた時
    end
  end

   private

   def set_item
    @item = Item.find(params[:item_id])
   end


   def delivery_params
     params.permit(:token,:prefecture_id,:postal_code,:city,:address1,:address2,:telephone).merge(user_id: current_user.id,item_id:params[:item_id])
   end

   def move_to_login
     unless user_signed_in?
       redirect_to new_user_session_path
     end
   end

  def move_to_indexx
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
   end
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: delivery_params[:token],
      currency:'jpy'
    )
  end

  
 end
