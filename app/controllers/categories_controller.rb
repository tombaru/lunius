class CategoriesController < ApplicationController

  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @products = @category.products
  end

end
