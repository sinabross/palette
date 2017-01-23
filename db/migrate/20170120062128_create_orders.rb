class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

      t.string :name
      t.string :tel
      t.string :address
      t.string :money_name
      t.string :product_brand
      t.string :product_name
      t.integer :product_price
      t.integer :product_number, default: 1
      t.string :confirm, default:"미확정"




      t.timestamps null: false
    end
  end
end
