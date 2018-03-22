# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#coding:utf-8
Drink.create(
  :name=>'monsterenergy',
  :cafeinamount=>'142',
  :amount=>'355',
  :imglink=>'//ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&MarketPlace=JP&ASIN=B007V6MQJY&ServiceVersion=20070822&ID=AsinImage&WS=1&Format=_SL250_&tag=cafemanawe00d-22',
  :outimglink=>'//ir-jp.amazon-adsystem.com/e/ir?t=cafemanawe00d-22&l=am2&o=9&a=B007V6MQJY" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;',
  :productlink=>'https://www.amazon.co.jp/gp/offer-listing/B007V6MQJY/ref=as_li_tl?ie=UTF8&camp=247&creative=1211&creativeASIN=B007V6MQJY&linkCode=am2&tag=cafemanawe00d-22&linkId=74b8051f935f783d32d883111e198b0a'
 )
Drink.create(
  :name=>'コーヒーボス　無糖ブラック',
  :cafeinamount=>'92',
  :amount=>'185',
  :imglink=>'//ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&MarketPlace=JP&ASIN=B003OAA5IK&ServiceVersion=20070822&ID=AsinImage&WS=1&Format=_SL250_&tag=cafemanawe00d-22',
  :outimglink=>'//ir-jp.amazon-adsystem.com/e/ir?t=cafemanawe00d-22&l=am2&o=9&a=B003OAA5IK" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;',
  :productlink=>'https://www.amazon.co.jp/gp/offer-listing/B003OAA5IK/ref=as_li_tl?ie=UTF8&camp=247&creative=1211&creativeASIN=B003OAA5IK&linkCode=am2&tag=cafemanawe00d-22&linkId=d7870d0c099fbf4c6c046a17cbb97ebf'
)
# Drink.create(
#   :name=>'MATCH',
#   :cafeinAmount=>'25',
#   :Amount=>'500',
#   :imgLink=>'//ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&MarketPlace=JP&ASIN=B00G3XZ3XW&ServiceVersion=20070822&ID=AsinImage&WS=1&Format=_SL250_&tag=cafemanawe00d-22',
#   :outimgLink=>'//ir-jp.amazon-adsystem.com/e/ir?t=cafemanawe00d-22&l=am2&o=9&a=B00G3XZ3XW" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;',
#   :productLink=>'https://www.amazon.co.jp/gp/offer-listing/B00G3XZ3XW/ref=as_li_tl?ie=UTF8&camp=247&creative=1211&creativeASIN=B00G3XZ3XW&linkCode=am2&tag=cafemanawe00d-22&linkId=981892d26604d4eaf6da745758a64f1f'
# )
# Drink.create(
#   :name=>'ベリーマッチ',
#   :cafeinAmount=>'25',
#   :Amount=>'500',
#   :imgLink=>'//ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&MarketPlace=JP&ASIN=B01CQV3U84&ServiceVersion=20070822&ID=AsinImage&WS=1&Format=_SL250_&tag=cafemanawe00d-22',
#   :outimgLink=>'//ir-jp.amazon-adsystem.com/e/ir?t=cafemanawe00d-22&l=am2&o=9&a=B01CQV3U84" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;',
#   :productLink=>'https://www.amazon.co.jp/gp/offer-listing/B01CQV3U84/ref=as_li_tl?ie=UTF8&camp=247&creative=1211&creativeASIN=B01CQV3U84&linkCode=am2&tag=cafemanawe00d-22&linkId=e945a390ed731467ea93e687b767e998'
# )
# #--------------------up date 2/24-------------------------------------------------
# Drink.create(
#   :name=>'マッチセットポジション ',
#   :cafeinAmount=>'12',
#   :Amount=>'240',
#   :imgLink=>'//ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&MarketPlace=JP&ASIN=B01LSA1XGA&ServiceVersion=20070822&ID=AsinImage&WS=1&Format=_SL250_&tag=cafemanawe00d-22',
#   :outimgLink=>'//ir-jp.amazon-adsystem.com/e/ir?t=cafemanawe00d-22&l=am2&o=9&a=B01LSA1XGA" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;',
#   :productLink=>'https://www.amazon.co.jp/gp/offer-listing/B01LSA1XGA/ref=as_li_tl?ie=UTF8&camp=247&creative=1211&creativeASIN=B01LSA1XGA&linkCode=am2&tag=cafemanawe00d-22&linkId=b778df4cf09d3d1e22226a6c8d9b8de8'
# )
#
# Drink.create(
#   :name=>'午後の紅茶ミルクティー',
#   :cafeinAmount=>'80',
#   :Amount=>'500',
#   :imgLink=>'//ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&ASIN=B00U8O4QY4&Format=_SL160_&ID=AsinImage&MarketPlace=JP&ServiceVersion=20070822&WS=1&tag=cafemanawe00d-22',
#   :outimgLink=>'https://ir-jp.amazon-adsystem.com/e/ir?t=cafemanawe00d-22&l=li2&o=9&a=B00U8O4QY4" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important',
#   :productLink=>'https://www.amazon.co.jp/gp/product/B00U8O4QY4/ref=as_li_ss_il?ie=UTF8&linkCode=li2&tag=cafemanawe00d-22&linkId=0af87838a8255c8ae3f42756599e6cf6'
# )
# Drink.create(
#   :name=>'午後の紅茶ストレートティー',
#   :cafeinAmount=>'70',
#   :Amount=>'500',
#   :imgLink=>'//ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&ASIN=B00U8O4QRG&Format=_SL160_&ID=AsinImage&MarketPlace=JP&ServiceVersion=20070822&WS=1&tag=cafemanawe00d-22',
#   :outimgLink=>'https://ir-jp.amazon-adsystem.com/e/ir?t=cafemanawe00d-22&l=li2&o=9&a=B00U8O4QRG" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;',
#   :productLink=>'https://www.amazon.co.jp/gp/product/B00U8O4QRG/ref=as_li_ss_il?ie=UTF8&linkCode=li2&tag=cafemanawe00d-22&linkId=383056acde34b056f546af5ef573ce86'
# )
# Drink.create(
#   :name=>'午後の紅茶レモンティー',
#   :cafeinAmount=>'40',
#   :Amount=>'500',
#   :imgLink=>'//ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&ASIN=B00U8O4R7U&Format=_SL160_&ID=AsinImage&MarketPlace=JP&ServiceVersion=20070822&WS=1&tag=cafemanawe00d-22',
#   :outimgLink=>'https://ir-jp.amazon-adsystem.com/e/ir?t=cafemanawe00d-22&l=li2&o=9&a=B00U8O4R7U" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;',
#   :productLink=>'https://www.amazon.co.jp/gp/product/B00U8O4R7U/ref=as_li_ss_il?ie=UTF8&linkCode=li2&tag=cafemanawe00d-22&linkId=60f12435b6b881cf9d3797ef36f0d697'
# )
# #--------------------------------3/2up date-------------------------------------------
# Drink.create(
#   :name=>'クラフトボス',
#   :cafeinAmount=>'200',
#   :Amount=>'500',
#   :imgLink=>'//ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&MarketPlace=JP&ASIN=B06XJVXMZR&ServiceVersion=20070822&ID=AsinImage&WS=1&Format=_SL250_&tag=cafemanawe00d-22',
#   :outimgLink=>'//ir-jp.amazon-adsystem.com/e/ir?t=cafemanawe00d-22&l=am2&o=9&a=B06XJVXMZR" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;',
#   :productLink=>'https://www.amazon.co.jp/gp/offer-listing/B06XJVXMZR/ref=as_li_tl?ie=UTF8&camp=247&creative=1211&creativeASIN=B06XJVXMZR&linkCode=am2&tag=cafemanawe00d-22&linkId=3e7e7ff5a75d0e53ad6b4f5439e86099'
# )

# Drink.create(
#   :name=>'',
#   :cafeinAmount=>'',
#   :Amount=>'',
#   :imgLink=>'',
#   :outimgLink=>'',
#   :productLink=>''
# )

# Drink.create(
#   :name=>'オロナミンC',
#   :cafeinAmount=>'18',
#   :Amount=>'120',
#   :imgLink=>'',
#   :outimgLink=>'',
#   :productLink=>''
# )
# Drink.create(
#   :name=>'サントリーウーロン茶',
#   :cafeinAmount=>'100',
#   :Amount=>'500',
#   :imgLink=>'',
#   :outimgLink=>'',
#   :productLink=>''
# )
# Drink.create(
#   :name=>'クラフトボス',
#   :cafeinAmount=>'200',
#   :Amount=>'500',
#   :imgLink=>'',
#   :outimgLink=>'',
#   :productLink=>''
# )
# Drink.create(
#   :name=>'クラフトボスラテ',
#   :cafeinAmount=>'150',
#   :Amount=>'500',
#   :imgLink=>'',
#   :outimgLink=>'',
#   :productLink=>''
# )
# Drink.create(
#   :name=>'ペプシストロング5.0GV',
#   :cafeinAmount=>'93',
#   :Amount=>'490',
#   :imgLink=>'',
#   :outimgLink=>'',
#   :productLink=>''
# )
# Drink.create(
#   :name=>'ペプシコーラ',
#   :cafeinAmount=>'50',
#   :Amount=>'500',
#   :imgLink=>'',
#   :outimgLink=>'',
#   :productLink=>''
# )
# Drink.create(
#   :name=>'ペプシリフレッシュショット',
#   :cafeinAmount=>'38',
#   :Amount=>'200',
#   :imgLink=>'',
#   :outimgLink=>'',
#   :productLink=>''
# )
# Drink.create(
#   :name=>'デカビタC',
#   :cafeinAmount=>'210',
#   :Amount=>'21',
#   :imgLink=>'',
#   :outimgLink=>'',
#   :productLink=>''
# )
# Drink.create(
#   :name=>'キリンメッツコーラ',
#   :cafeinAmount=>'48',
#   :Amount=>'480',
#   :imgLink=>'',
#   :outimgLink=>'',
#   :productLink=>''
# )
# Drink.create(
#   :name=>'アサヒドデカミン',
#   :cafeinAmount=>'50',
#   :Amount=>'500',
#   :imgLink=>'',
#   :outimgLink=>'',
#   :productLink=>''
# )
# Drink.create(
#   :name=>'アサヒドデカミンストロング',
#   :cafeinAmount=>'60',
#   :Amount=>'300',
#   :imgLink=>'',
#   :outimgLink=>'',
#   :productLink=>''
# )
# Drink.create(
#   :name=>'',
#   :cafeinAmount=>'',
#   :Amount=>'',
#   :imgLink=>'',
#   :outimgLink=>'',
#   :productLink=>''
# )
