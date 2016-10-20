class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.text :message
      t.string :receiver
      t.date :send_date
      t.boolean :sent
      t.string :response
      t.date :response_date
      t.references :user, index: true, foreign_key: true
      t.references :service, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
