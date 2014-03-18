class AddFieldToActors < ActiveRecord::Migration
  def change
    add_column :actors, :star_id, :integer
  end
end
