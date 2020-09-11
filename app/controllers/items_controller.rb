class ItemsController < ApplicationController
before_action :move_to_index,except:[:index,:show]
before_action :set_item, only:[:edit,:show,:update]
before_action :only_seller,only:[:edit,:destroy]

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
        @comment = Comment.new
        @comments = @item.comments.includes(:user)
      end

      def edit
        
      end

      def destroy
        item = Item.find(params[:id])
        if item.destroy
           redirect_to root_path
        else
          render :show
        end
     end

      def update
        if @item.update(item_params)
            redirect_to root_path
        else
          render :edit
        end
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
    
    def set_item
      @item=Item.find(params[:id])
    end

    def only_seller
      @item=Item.find(params[:id])
      unless current_user.id == @item.user_id
        redirect_to new_user_session_path
      end
    end
end

  

