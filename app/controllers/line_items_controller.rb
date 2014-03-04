class LineItemsController < InheritedResources::Base


def create

		@cart = current_cart
		product = Product.find(params[:product_id])
		@line_item = @cart.add_product(product.id)

		respond_to do |format|

				if @line_item.save
						format.html { redirect_to @line_item.cart,
								notice: 'Line item was succesfully created'}
				else
						format.html { render action: "new"}
				end
		end
end
end
