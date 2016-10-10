class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :id_user
      t.string :email
      t.string :api_key
      t.string :api_secret

      t.timestamps null: false
    end
  end
end
