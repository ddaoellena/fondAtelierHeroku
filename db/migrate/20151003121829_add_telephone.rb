class AddTelephone < ActiveRecord::Migration
  def change
  	add_column :annonces, :telephone, :string
  end
end
