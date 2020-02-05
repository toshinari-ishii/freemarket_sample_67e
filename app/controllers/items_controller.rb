class ItemsController < ApplicationController
  def index
    @items = Item.where(buyer: nil).order(id:"DESC")
    @photos = Photo.all
  end
  def new

  end
  def show
    # binding.pry
    @item = Item.find(params[:id])
    @photos = Photo.where(item_id:params[:id])
    @user = User.find(@item.user_id)
    # binding.pry
    # binding.pry
  end
  def buy
    
  end
  def confirm
    
  end

  
end
