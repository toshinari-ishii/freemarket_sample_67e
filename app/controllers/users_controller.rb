class UsersController < ApplicationController
  def show
    @user = current_user
    @items = Item.where(user_id: @user.id)
    @item = Item.find(params[:id])
    @photos = @item.photos
  end
end
