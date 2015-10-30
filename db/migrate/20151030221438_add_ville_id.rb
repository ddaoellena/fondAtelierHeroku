class AddVilleId < ActiveRecord::Migration
  def change
	add_column :annonces, :ville_id, :integer
  end
end
