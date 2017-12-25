class CreateDrinkeds < ActiveRecord::Migration[5.1]
  def change
    create_table :drinkeds do |t|
      t.integer :user_id
      t.integer :drink_id
      t.integer :minit
      t.timestamps
    end
  end
end
