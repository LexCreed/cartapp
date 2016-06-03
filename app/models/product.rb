class Product < ActiveRecord::Base

	has_many :hasBuyOrders
	has_many :buyOrders, through: :hasBuyOrders

 	has_attached_file :cover, styles: {thumb:"400x300", mini:"400x200"}
    validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/

end
