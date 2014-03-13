class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :revenue
      t.string :poster
      t.string :movie_id
      t.string :release_date
      t.string :runtime

      t.timestamps
    end
  end
end
