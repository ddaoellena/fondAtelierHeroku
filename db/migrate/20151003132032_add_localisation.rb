class AddLocalisation < ActiveRecord::Migration
  def change
  	add_column :annonces, :ville, :string
  	add_column :annonces, :ecole, :string
  end
end
