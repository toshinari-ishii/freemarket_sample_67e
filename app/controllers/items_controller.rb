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
    binding.pry
    @item = Item.find(params[:id])
    @item.update(buyer: current_user.id)

    Payjp.api_key = "sk_test_265301405b3342f54b10a319"
    Payjp::Charge.create(
      amount: 809, # 決済する値段
      card: params['payjp-token'], # フォームを送信すると作成・送信されてくるトークン
      currency: 'jpy'
    )    
    
    redirect_to '/'
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to '/'
  end

  
end
