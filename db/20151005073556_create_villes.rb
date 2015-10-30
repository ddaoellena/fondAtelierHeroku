class CreateVilles < ActiveRecord::Migration
  def change
    create_table :villes do |t|
    	t.string :nom_ville	
    end
  end
end
