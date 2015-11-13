class CreateStatuts < ActiveRecord::Migration
  def change
    create_table :statuts do |t|

      t.timestamps null: false
    end
  end
end
