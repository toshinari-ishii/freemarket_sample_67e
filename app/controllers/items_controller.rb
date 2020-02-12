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

    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price, # Payjpに載る金額
      customer: card.customer_id, # 顧客ID
      currency: 'jpy'
    )
    redirect_to '/'
    flash[:notice] = "購入が完了しました　また貯金が減ったで！！！"
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to '/'
  end

  
end
