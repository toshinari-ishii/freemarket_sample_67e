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

    card = Card.find_by(user_id: current_user.id)
    if card == nil
      redirect_to new_card_path
      flash[:noCard] = "Cardが登録されていませんので登録してください"
    else
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.price, # Payjpに載る金額
        customer: card.customer_id, # 顧客ID
        currency: 'jpy'
      )
      redirect_to '/'
      flash[:notice] = "購入が完了しました　また貯金が減ったで！！！"
    end
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

  def edit
    @item = Item.find(params[:id])

  end

  def update
    
  end
  
end
