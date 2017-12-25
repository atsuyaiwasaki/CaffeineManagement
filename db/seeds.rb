# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#coding:utf-8
Drink.create(:name=>'drinkA',:cafeinAmount=>'100',:Amount=>'250')
Drink.create(:name=>'drinkB',:cafeinAmount=>'100',:Amount=>'250')
Drink.create(:name=>'drinkC',:cafeinAmount=>'100',:Amount=>'250')
User.create(:name=>'user1',:weght=>60,:u_id=>1)
#User_drink.create(:user_id=>1,:drink_id=>1)
