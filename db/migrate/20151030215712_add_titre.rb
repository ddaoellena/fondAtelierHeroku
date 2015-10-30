class AddTitre < ActiveRecord::Migration
  def change
	add_column :annonces, :titre, :string
  end
end
