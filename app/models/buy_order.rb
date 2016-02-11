class BuyOrder < ActiveRecord::Base
has_many :hasBuyOrders
has_many :products, through: :hasBuyOrders 
after_create :save_products
def products=(value)
		@products=value
		#logger.debug @products
end
def save_products
		@products.each do |product|
		productTemp=product[:product]
		quantity =product[:quantity]
		HasBuyOrder.create(product_id: productTemp.id, buy_order_id: self.id, quantity: quantity)	
		end 
end
end
