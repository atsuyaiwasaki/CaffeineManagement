class CreateUserDrinks < ActiveRecord::Migration[5.1]
  def change
    create_table :user_drinks do |t|
      t.references :user, index: true,foreign_key:true
      t.references :drink, index: true,foreign_key:true    
      t.timestamps
    end
  end
end
