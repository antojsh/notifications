class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.references :user, index: true, foreign_key: true
      t.references :service, index: true, foreign_key: true
      t.integer :total
      t.boolean :ilimitado

      t.timestamps null: false
    end
  end
end
