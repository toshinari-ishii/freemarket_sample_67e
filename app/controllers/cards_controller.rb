class CardsController < ApplicationController

  before_action :set_card, only: [:new, :delete, :show]

  def new
    if @card.present?
      redirect_to card_path(id: @card.user_id)
    end
  end

  def create #PayjpとCardのデータベースを作成
    Payjp.api_key = Rails.application.credentials.payjp[:secret_access_key]

    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      # トークンが正常に発行されていたら、顧客情報をPAY.JPに登録します。
      customer = Payjp::Customer.create(
        description: 'test', # 無くてもOK。PAY.JPの顧客情報に表示する概要です。
        email: current_user.email,
        card: params['payjp-token'], # 直前のnewアクションで発行され、送られてくるトークンをここで顧客に紐付けて永久保存します。
        metadata: {user_id: current_user.id} # 無くてもOK。
      )
    end
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to cards_path(id: @card.user_id)
      else
        redirect_to action: "create"
      end
  end

  def show #Cardのデータをpayjpに送り情報を取り出します
    if @card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = Rails.application.credentials.payjp[:secret_access_key]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def delete #PayjpとCardデータベースを削除します
    if @card.blank?
    else
      Payjp.api_key = Rails.application.credentials.payjp[:secret_access_key]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
    end
      redirect_to action: "new"
  end

  private

    def set_card
      if Card.where(user_id: current_user.id).present?
      @card = current_user.card
    end
  end
end



