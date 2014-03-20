class AddDvdToActors < ActiveRecord::Migration
  def change
    add_column :actors, :dvd, :integer
    add_column :actors, :budget, :integer
  end
end
