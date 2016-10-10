class RanemaIduserToIdentification < ActiveRecord::Migration
  def change
     rename_column :users, :id_user, :identification
  end
end
