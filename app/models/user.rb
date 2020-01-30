class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :first_name, :last_name, :first_hurigana, :last_hurigana, :birthday, :password, presence: true

  def self.zenkaku?(str)
    return nil if str.nil?
    # 全角のみOKなので、半角が混ざっているとfalseが返る
    unless str.to_s =~/^[^ -~｡-ﾟ]*$/
      return false
    end
    return true
  end
  
  
  
  
end
