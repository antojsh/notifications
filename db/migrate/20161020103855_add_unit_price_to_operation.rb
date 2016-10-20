class AddUnitPriceToOperation < ActiveRecord::Migration
  def change
        add_column :operations, :unit_price, :integer
  end
end
