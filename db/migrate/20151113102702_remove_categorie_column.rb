class RemoveCategorieColumn < ActiveRecord::Migration
  def change
  	remove_column :annonces, :categorie
  end
end
