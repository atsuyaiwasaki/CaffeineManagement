class Addhash < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :add_hash, :string
  end
end
