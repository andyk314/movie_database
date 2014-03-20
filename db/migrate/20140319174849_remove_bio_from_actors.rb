class RemoveBioFromActors < ActiveRecord::Migration
  def change
    remove_column :actors, :bio, :string
  end
end
