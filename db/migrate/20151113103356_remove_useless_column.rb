class RemoveUselessColumn < ActiveRecord::Migration
  def change
  	remove_column :annonces, :ville
  	remove_column :annonces, :ecole
  end
end
