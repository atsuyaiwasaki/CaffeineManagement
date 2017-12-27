class Drink < ApplicationRecord
  has_many :UserDrink,foreign_key: 'Drink_id'
  has_many :User,:through=>:UserDrink
end
