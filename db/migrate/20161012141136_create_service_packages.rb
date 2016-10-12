class CreateServicePackages < ActiveRecord::Migration
  def change
    create_table :service_packages do |t|
      t.references :service, index: true, foreign_key: true
      t.references :package, index: true, foreign_key: true
      t.integer :total
      t.boolean :ilimitado
      t.integer :unit_price

      t.timestamps null: false
    end
  end
end
