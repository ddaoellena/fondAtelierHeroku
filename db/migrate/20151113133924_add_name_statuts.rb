class AddNameStatuts < ActiveRecord::Migration
  def change
  	add_column :statuts, :name, :string
  end
end
