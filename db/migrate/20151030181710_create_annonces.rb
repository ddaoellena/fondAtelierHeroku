class CreateAnnonces < ActiveRecord::Migration
  def change
	t.string :name
    t.text :description
    create_table :annonces do |t|

      t.timestamps
    end
  end
end
