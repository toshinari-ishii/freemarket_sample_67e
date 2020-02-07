class Item < ApplicationRecord
  has_many :photos, dependent: :destroy
  belongs_to :user
  belongs_to :category
  accepts_nested_attributes_for :photos,allow_destroy: true 
end
