class CreateHasBuyOrders < ActiveRecord::Migration
  def change
    create_table :has_buy_orders do |t|
      t.references :buyOrder, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
