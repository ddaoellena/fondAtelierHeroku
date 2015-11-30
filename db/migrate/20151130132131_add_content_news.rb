class AddContentNews < ActiveRecord::Migration
  def change
  	add_column :news, :titre, :string
  	add_column :news, :contenu, :text
  end
end
