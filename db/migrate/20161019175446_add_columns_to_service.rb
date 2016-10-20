class AddColumnsToService < ActiveRecord::Migration
  def change
    add_column :services, :total, :integer
    add_column :services, :price, :integer
    add_column :services, :method, :string
  end
end
