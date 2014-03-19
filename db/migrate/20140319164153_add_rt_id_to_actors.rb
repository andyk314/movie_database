class AddRtIdToActors < ActiveRecord::Migration
  def change
    add_column :actors, :rt_id, :integer
  end
end
