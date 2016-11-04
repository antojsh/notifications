class AddIlimatoToService < ActiveRecord::Migration
  def change
     add_column :services, :ilimitado, :boolean
  end
end
