class RemoveFieldsFromMovies < ActiveRecord::Migration
  def change
    remove_column :movies, :revenue, :string
    remove_column :movies, :poster, :string
    remove_column :movies, :release_date, :string
  end
end
