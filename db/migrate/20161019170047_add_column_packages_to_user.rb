class AddColumnPackagesToUser < ActiveRecord::Migration
  def change
    add_reference :users, :package, index: true
  end
end
