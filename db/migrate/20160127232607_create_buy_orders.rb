class CreateBuyOrders < ActiveRecord::Migration
  def change
    create_table :buy_orders do |t|
      t.string :name
      t.string :number_order
      t.date :date_delivery
      t.date :date_order
      t.boolean :payment

      t.timestamps null: false
    end
  end
end
