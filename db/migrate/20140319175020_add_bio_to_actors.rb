class AddBioToActors < ActiveRecord::Migration
  def change
    add_column :actors, :bio, :text
  end
end
