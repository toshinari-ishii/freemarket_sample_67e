class UsersController < ApplicationController
  def show
    @user = current_user
    @items = Item.where(user_id: @user.id)
    @photos = Photo.all
  end
end
