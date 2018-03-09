class Des < ActiveRecord::Migration[5.1]
  def change
    des = Drink.find_by(id:12)
    des.destroy
    des = Drink.find_by(id:13)
    des.destroy
    des = Drink.find_by(id:14)
    des.destroy
    des = Drink.find_by(id:15)
    des.destroy
    des = Drink.find_by(id:16)
    des.destroy
  end
end
