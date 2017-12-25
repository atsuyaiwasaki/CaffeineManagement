class KastablenameRename < ActiveRecord::Migration[5.1]
  def change
    rename_table :drinkeds, :user_drink
  end
end
