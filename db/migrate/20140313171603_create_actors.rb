class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.string :name
      t.string :birthdate
      t.string :picture

      t.timestamps
    end
  end
end
