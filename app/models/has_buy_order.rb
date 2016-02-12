class HasBuyOrder < ActiveRecord::Base
  belongs_to :product
  belongs_to :buyOrder 
  
end
