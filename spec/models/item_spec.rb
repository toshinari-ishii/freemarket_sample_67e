require 'rails_helper'

describe Item do
  describe '#create' do

    it "(1) nameは必須です。" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "(2) textは必須です。" do
      item = build(:item, text: "")
      item.valid?
      expect(item.errors[:text]).to include("can't be blank")
    end

    it "(3) conditionは必須です。" do
      item = build(:item, condition: "")
      item.valid?
      expect(item.errors[:condition]).to include("can't be blank")
    end

    it "(4) burdenは必須です。" do
      item = build(:item, burden: "")
      item.valid?
      expect(item.errors[:burden]).to include("can't be blank")
    end

    it "(5) areaは必須です。" do
      item = build(:item, area: "")
      item.valid?
      expect(item.errors[:area]).to include("can't be blank")
    end

    it "(6) dayは必須です。" do
      item = build(:item, day: "")
      item.valid?
      expect(item.errors[:day]).to include("can't be blank")
    end

    it "(7) priceは必須です。" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end
  end
end
