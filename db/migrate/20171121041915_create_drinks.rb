class CreateDrinks < ActiveRecord::Migration[5.1]
  def change
    create_table :drinks do |t|
      t.string :Name
      t.integer :cafeinAmount
      t.integer :Amount

      t.timestamps
    end
  end
end
