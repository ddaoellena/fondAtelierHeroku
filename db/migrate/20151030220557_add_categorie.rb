class AddCategorie < ActiveRecord::Migration
  def change
	add_column :annonces, :categorie, :text
  end
end
