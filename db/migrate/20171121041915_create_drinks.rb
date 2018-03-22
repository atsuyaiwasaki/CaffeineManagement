class CreateDrinks < ActiveRecord::Migration[5.1]
  def change
    create_table :drinks do |t|
      t.string :name
      t.integer :cafeinamount
      t.integer :Amount

      t.timestamps
    end
  end
end
