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
  def buy
    
  end
  def confirm
    
  end

  def destroy
    item = Item.find(params[:id])
      item.destroy
      redirect_to '/'
  end

  
end
