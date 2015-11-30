class AddDateBlog < ActiveRecord::Migration
  def change
  	add_column :news, :date, :string
  end
end
