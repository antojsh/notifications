class CreateMovements < ActiveRecord::Migration
  def change
    create_table :movements do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :debito
      t.integer :credito
      t.string :description

      t.timestamps null: false
    end
  end
end
