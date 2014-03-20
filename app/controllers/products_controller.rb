class ProductsController < ApplicationController
  before_action :set_product, only: [:show]
  def index
    @products = Product.all
    @categories = Category.all
    @cart = current_cart
  end

  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @products = @category.products
  end

  def who_bought
    @product = Product.find(params[:id])
    respond_to do |format|
      format.atom
    end
  

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params[:product].permit :name, :price
    end


end
