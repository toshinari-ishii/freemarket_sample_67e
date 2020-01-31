require 'rails_helper'

describe User do
  describe '#create' do
    
    it "(1) nicknameは必須です。" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "(2-1) first_name(名)は必須です。" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it "(2-2) first_name(名)は全角が必須です。" do
      user = build(:user, first_name: "kenichi")
      user.valid?
      expect(user.errors[:zenkaku_first_name]).to include("全角ではありません")
    end

    it "(3-1) last_name(姓)は必須です。" do
      user = build(:user, last_name: "")
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it "(3-2) last_name(姓)は全角が必須です。" do
      user = build(:user, last_name: "takada")
      user.valid?
      expect(user.errors[:zenkaku_last_name]).to include("全角ではありません")
    end

    it "(4) first_hurigana(名)は必須です。" do
      user = build(:user, first_hurigana: "")
      user.valid?
      expect(user.errors[:first_hurigana]).to include("can't be blank")
    end

    it "(5) last_hurigana(姓)は必須です。" do
      user = build(:user, last_hurigana: "")
      user.valid?
      expect(user.errors[:last_hurigana]).to include("can't be blank")
    end

    it "(6) birthdayは必須です。" do
      user = build(:user, birthday: "")
      user.valid?
      expect(user.errors[:birthday]).to include("can't be blank")
    end

    it "(7-1) emailは必須です。" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "(7-2) emailは一意です" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "(7-3) @とdomainを含みます" do
      user = build(:user, email: "thirdgmail.com")
      user.valid?
      expect(user.errors[:email]).to include ("is invalid")
    end    
    
    it "(8-1) passwordは必須です" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end    
    
    it "(8-2) passwordが存在してもpassword_confirmationが空では登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "(8-3) passwordが7文字以上なら登録可能" do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user).to be_valid
    end

    it "(8-4) passwordが6文字以下なら登録不可" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end

  end
end