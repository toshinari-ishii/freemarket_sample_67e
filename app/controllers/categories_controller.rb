class CategoriesController < ApplicationController
  def new
    @parents = Category.where(ancestry: nil)
  end
end
