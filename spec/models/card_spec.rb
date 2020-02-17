require 'rails_helper'

describe Card do
  describe '#create' do
    it "user_idが空の場合" do
    card = build(:card, user_id: "")
    card.valid?
    expect(card.errors[:user_id]).to include("can't be blank")  
    end

    it "customer_idが空の場合" do
    card = build(:card, customer_id: "")
    card.valid?
    expect(card.errors[:customer_id]).to include("can't be blank")  
    end

    it "card_idのトークンがない場合" do
    card = build(:card, card_id: "")
    card.valid?
    expect(card.errors[:card_id]).to include("can't be blank") 
    end
    
  end
end
