class Rename < ActiveRecord::Migration[5.1]
  def change
    rename_column :drinks,:Name,:name
  end
end
