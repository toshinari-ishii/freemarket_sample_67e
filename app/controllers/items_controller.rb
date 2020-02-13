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
    @children = Category.where(ancestry: params[:parent_name])
  end


  def grandchildren
    @grandchildren = Category.where(['ancestry LIKE ?', "%#{params[:child_name]}%"])
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


  def edit
    @categories = Category.where(ancestry: nil)
    # binding.pry
    @item = Item.find(params[:id])
    # binding.pry
    @photos = @item.photos
    @user = @item.user
    @grandchild = Category.find(@item.category_id)
    
    @grandchildren = @grandchild.siblings
    @child = @grandchild.parent
    @parent = @child.parent

    @children = @child.siblings
    @parents = @parent.siblings
    @photos = Photo.where(item_id: params[:id])

  end

  def update
    if @item.update(item_params)
    else
      render 'edit'
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :text,:condition,:burden, :area, :day, :price, :category_id, :user_id, :buyer , photos_attributes: [:image]).merge(user_id: current_user.id)
  end

  
end
