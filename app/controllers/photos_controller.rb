class PhotosController < ApplicationController
	def show
    @products = Product.all
    @product = Product.find(params[:id])
    @photos = @photo.products
  end
end
