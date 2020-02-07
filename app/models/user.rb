class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  has_many :cards
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :first_name, :last_name, :first_hurigana, :last_hurigana, :birthday, :postcode, :prefecture, :city, :block, :password, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validate :zenkaku_first_name, :zenkaku_last_name

  def zenkaku_first_name
    if first_name !~/^[^ -~｡-ﾟ]*$/
      errors.add(:zenkaku_first_name, "全角ではありません") # error message
    end
  end
  
  def zenkaku_last_name
    if last_name !~/^[^ -~｡-ﾟ]*$/
      errors.add(:zenkaku_last_name, "全角ではありません") # error message
    end
  end  
end
