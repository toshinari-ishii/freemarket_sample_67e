class ItemsController < ApplicationController
  def index
    @items = Item.where(buyer: nil).order(id:"DESC")
    @photos = Photo.all
  end
  def new

  end
  def show
    
  end
  def buy
    
  end
  def confirm
    
  end

  
end
