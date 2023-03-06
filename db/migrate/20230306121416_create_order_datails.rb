class CreateOrderDatails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_datails do |t|

      t.timestamps
    end
  end
end
