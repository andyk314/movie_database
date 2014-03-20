class AddQuoteToActor < ActiveRecord::Migration
  def change
    add_column :actors, :quote, :string
  end
end
