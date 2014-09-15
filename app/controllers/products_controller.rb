class ProductsController < ApplicationController
  before_action :set_product, only: [:show]
  def index
    @categories = Category.all
    @cart = current_cart

    @products = Product.order(:name)
    @products = @products.where('lower(name) LIKE ?', "%#{params[:search].downcase}%") if params[:search].present?
    if params[:advanced_search].present?
      Rails.logger.info "IN ADVANCED SEARCH================================"  
      if params[:advanced_search][:cost_max].present? 
        max_price = params[:advanced_search][:cost_max] 
      else
        max_price = 10000
      end   
      @products = @products.where("price > #{params[:advanced_search][:cost_min].to_i} and price < #{max_price}")
    end
    @products = @products.page(params[:page]).per(9)

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
      params[:product].permit :name, :price, :skill_list
    end


end
