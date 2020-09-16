class LikesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @likes=Like.where(user_id:@user.id)
  end


  def create
    @like = Like.new(user_id: current_user.id, item_id: params[:item_id])
    @like.save
    redirect_to "/items/#{params[:item_id]}"
    
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, item_id: params[:item_id])
    @like.destroy
    redirect_to "/items/#{params[:item_id]}" 
    
  end

end

