class AddFieldsToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :total_revenue, :integer
    add_column :movies, :usa_revenue, :integer
    add_column :movies, :international_revenue, :integer
    add_column :movies, :budget, :integer
    add_column :movies, :release_year, :integer
  end
end
