class ProductsController < ApplicationController
  before_action :set_product, only: [:show]
  def index
    @categories = Category.all
    @cart = current_cart
    if params[:search]
      @products = Product.where('lower(name) LIKE ?', "%#{params[:search].downcase}%").page(params[:page]).per(9)
    else
      @products = Product.order("name").page(params[:page]).per(9)
    end
  end

  def show
    @categories = Category.all
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
      Rails.logger.info @product.photo
      Rails.logger.info "=================="
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params[:product].permit :name, :price
    end


end
