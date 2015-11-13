class AddTypeId < ActiveRecord::Migration
  def change
  	add_column :annonces, :type_id, :integer
  end
end
