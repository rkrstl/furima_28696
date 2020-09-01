class ItemsController < ApplicationController
before_action :move_to_index,except:[:index,:show]

      def index
        @items=Item.all.order("items.created_at DESC")
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

      def show
        @item=Item.find(params[:id])
      end

      def edit
        @item=Item.find(params[:id])
      end

      def update
        item=Item.find(params[:id])
        item.update(item_params)
      end

  

  private
    def item_params
      params.require(:item).permit(:image,:name,:text,:price,:scheduled_delivery_id,:category_id,:prefecture_id,:shipping_fee_status_id,:sales_status_id).merge(user_id: current_user.id)
    end
 
    def move_to_index
      unless user_signed_in?
        redirect_to new_user_session_path
    end
  end  
end
  

