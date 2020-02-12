class ItemsController < ApplicationController
  def index
    @items = Item.where(buyer: nil).order(id:"DESC")
    @photos = Photo.all
  end

  def new
    @item = Item.new
    @photos = @item.photos.new
    @categories = Category.where(ancestry: nil)
  end
  def children
    # binding.pry
    # @children = Category.find_by(ancestry: params[:parent_name])
    @children = Category.where(ancestry: params[:parent_name])
    # @children = Category.find_by
  end
  def grandchildren
    
    @grandchildren = Category.where(['ancestry LIKE ?', "%#{params[:child_name]}%"])
    # binding.pry
  end
  def create
    @item = Item.new(item_params)
    # binding.pry
    if @item.save
    end
    redirect_to :root
  end

  def show
    @item = Item.find(params[:id])
    @photos = @item.photos
    @user = @item.user
  end
  
  def buy
    
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
  
  private
  def item_params
    params.require(:item).permit(:name, :text,:condition,:burden, :area, :day, :price, :category_id, :user_id, :buyer , photos_attributes: [:image]).merge(user_id: current_user.id)
  end

  
end
