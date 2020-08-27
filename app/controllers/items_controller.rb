class ItemsController < ApplicationController

  def index
    @items=Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item= Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
    def item_params
      params.require(:item).permit(:image,:name,:text,:price,:scheduled_delivery_id,:category_id,:prefecture_id,:shipping_fee_status_id,:sales_status_id).merge(user_id: current_user.id)
    end



  
end
