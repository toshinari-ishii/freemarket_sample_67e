class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :first_name, :last_name, :first_hurigana, :last_hurigana, :birthday, :password, presence: true


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validate :zenkaku
  # validate :first_name, :last_name

  def zenkaku
    if first_name !~/^[^ -~｡-ﾟ]*$/
      errors.add(:zenkaku, "全角ではありません") # error message
    end
  end
  
  # def self.zenkaku?(str)
  #   return nil if str.nil?
  #   # 全角のみOKなので、半角が混ざっているとfalseが返る
  #   unless str.to_s =~/^[^ -~｡-ﾟ]*$/
  #     return false
  #   end
  #   return true
  # end
  
end
