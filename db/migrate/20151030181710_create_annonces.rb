class CreateAnnonces < ActiveRecord::Migration
  def change
    create_table :annonces do |t|

      t.timestamps
    end
  end
end
