class AddColumnTohasBuyOrders < ActiveRecord::Migration
def up 
	add_column :has_buy_orders, :quantity, :integer
end

 def down 
 	remove_column :has_buy_orders, :quantity 
  end
end
