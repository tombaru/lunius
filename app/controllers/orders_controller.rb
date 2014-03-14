class OrdersController < InheritedResources::Base
	def new
			@cart = current_cart
			if @cart.line_items.empty?
					redirect_to product_url, notice: "Ваша корзина пуста"
					return
			end

			@order = Order.new
			respond_to do |format|
					format.html # new.html.erb
			end
	end
end
