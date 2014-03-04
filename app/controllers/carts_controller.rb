class CartsController < InheritedResources::Base 

		def show
				begin
						@cart = Cart.find(params[:id])
				rescue ActiveRecord::RecordNotFound
						logger.error "Попытка доступа к несуществующей корзине #{params[:id]}"
						redirect_to product_url, notice: 'Несуществующая корзина'
				else
						respond_to do |format|
								format.html # show.html.erb
						end
				end
		end

		def destroy
				@cart = current_cart
				@cart.destroy
				session[:cart_id] = nil
				respond_to do |format|
						format.html { redirect_to product_url, 
								notice: 'Теперь ваша корзина пуста' }
				end
		end
end
