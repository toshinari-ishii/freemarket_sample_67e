class CategoriesController < ApplicationController
  def parent
    @parents = Category.where(ancestry: nil)
  end

  def child
    @children = Category.find(params[:parent_id]).children
  end

  def grand_child
    @grand_children = Category.find(params[:child_id]).children
  end

end