class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
     @user = User.find(params[:id])
     if @user.update(user_params)
      bypass_sign_in(@user)

      else
        render 'edit'
      end

  end


  def listing
    # @items=Item.all.order("items.created_at DESC")
    @user = User.find(params[:id])
    # @item=Item.find(params[:id])
  end

  # def like
  #   @likes = current_user.likes
  # end


  private
    def user_params
    params.require(:user).permit(:password,:first_name,:first_name_kana,:last_name_kana,:last_name,:email)
    end

 end