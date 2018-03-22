class Makelink < ActiveRecord::Migration[5.1]
  def change
    add_column :drinks, :outimglink ,:text
    add_column :drinks, :imglink ,:text
    add_column :drinks, :productlink ,:text
  end
end
