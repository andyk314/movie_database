class ChangeFieldsToMovies < ActiveRecord::Migration
  def change
    change_column :movies, :total_revenue, :bigint
    change_column :movies, :usa_revenue, :bigint
    change_column :movies, :international_revenue, :bigint
    change_column :movies, :budget, :bigint
    change_column :movies, :release_year, :bigint
  end
end
