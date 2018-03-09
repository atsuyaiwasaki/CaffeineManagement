class Makelink < ActiveRecord::Migration[5.1]
  def change
    add_column :drinks, :outimgLink ,:text
    add_column :drinks, :imgLink ,:text
    add_column :drinks, :productLink ,:text
  end
end
