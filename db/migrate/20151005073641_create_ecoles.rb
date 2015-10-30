class CreateEcoles < ActiveRecord::Migration
  def change
    create_table :ecoles do |t|
	t.string :nom_ecole
    end
  end
end
