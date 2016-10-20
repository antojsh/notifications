class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.boolean :active
      t.timestamps null: false
    end
  end
end
