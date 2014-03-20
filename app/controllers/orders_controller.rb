class OrdersController < InheritedResources::Base
	def index
			@orders = Order.paginate page: params[:page], order: 'created_at desc', per_page: 10

			respond_to do |format|
				format.html # index.html.erb
			end
	end		

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

	def create
			@order = Order.new(order_params)
			@order.add_line_items_from_cart(current_cart)

			respond_to do |format|
					if @order.save
							Cart.destroy(session[:cart_id])
							session[:cart_id] = nil
							format.html {redirect_to root_path, notice:
									'Thank you for your order'}
					else
							@cart = current_cart
							format.html {render action: "new"}
					end
			end
	end	

private

  def order_params
    params[:order].permit :name, :address, :email, :pay_type
  end

end
