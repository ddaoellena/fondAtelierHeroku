class AddStatutUsers < ActiveRecord::Migration
  def change
  	add_column :users, :statut_id, :integer
  end
end
