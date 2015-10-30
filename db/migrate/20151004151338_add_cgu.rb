class AddCgu < ActiveRecord::Migration
  def change
  	add_column :annonces, :cgu, :boolean
  end
end
