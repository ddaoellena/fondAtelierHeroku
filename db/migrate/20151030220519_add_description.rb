class AddDescription < ActiveRecord::Migration
  def change
	add_column :annonces, :description, :text
  end
end
