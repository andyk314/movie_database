class AddRatingsToActor < ActiveRecord::Migration
  def change
    add_column :actors, :rotten, :string, array:true
    add_column :actors, :fresh, :string, array:true
  end
end
