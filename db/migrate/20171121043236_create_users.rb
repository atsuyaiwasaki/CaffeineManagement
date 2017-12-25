class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :weght
      t.string :u_id
      t.string :nickname
      t.string :image_url
      t.timestamps
    end
  end
end
