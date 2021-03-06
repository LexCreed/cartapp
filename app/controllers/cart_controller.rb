class CartController < ApplicationController
before_action :authenticate_user!	


skip_before_action :verify_authenticity_token
	def add
	  	id = params[:id]

		  	if session[:cart] then
		  		cart = session[:cart]
			else
				session[:cart] = {}
				cart = session[:cart]
		  	end
		  	
		  	if cart[id] then
			   cart[id] = cart[id] + 1
			else
				cart[id] = 1
		  	end
	  	redirect_to :action => :index
	end

	def clearCart
		session[:cart] = nil
		@products = nil
		redirect_to :action => :index	
	end

  def index
	  	if session[:cart] then
	  		build_cart
		else  
	  		@cart = {}
	  		@products =[]

	  	end
	  	#logger.debug @products
  end
   
   def create
   	@buyOrder=BuyOrder.new
   	build_cart
   	#logger.debug @products
   	@buyOrder.products=@products
   	time = Time.now
	date_str=time.to_formatted_s(:short)
   	@buyOrder.name=current_user.email+"_"+date_str
   	@buyOrder.date_order=Time.now

   

   #logger.debug @buyOrder.products
   	if @buyOrder.save
   		redirect_to @buyOrder
	end

   end
private
 def build_cart
	if session[:cart] then
	  		@cart = session[:cart]
	  		@products =[]
	  		@cart.each do | id, quantity|
				@products<<{ product: Product.find_by_id(id),quantity: quantity}
			end
   end
end
end

