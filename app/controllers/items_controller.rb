class ItemsController < ApplicationController
  def index
    @items = Item.where(buyer: nil).order(id:"DESC")
    @photos = Photo.all
  end

  def new
  end

  def show
    @item = Item.find(params[:id])
    @photos = @item.photos
    @user = @item.user
  end

  def create
  end

  def confirm
    @item = Item.find(params[:id])
    @photos = @item.photos
    @user = @item.user
  end

  def buy
    @item = Item.find(params[:id])
    @item.update(buyer: current_user.id)
    redirect_to '/'
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to '/'
  end

  
end
