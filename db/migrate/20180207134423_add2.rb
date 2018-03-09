class Add2 < ActiveRecord::Migration[5.1]
  def change
    dri=Drink.find_by(id:100)
    dri.imgrink = '//ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&ASIN=B005F25MQ0&Format=_SL250_&ID=AsinImage&MarketPlace=JP&ServiceVersion=20070822&WS=1&tag=cafemanawe00d-22'
    dri.outimgrink = 'https://ir-jp.amazon-adsystem.com/e/ir?t=cafemanawe00d-22&l=li3&o=9&a=B005F25MQ0'
    dri.productrink = 'https://www.amazon.co.jp/gp/product/B005F25MQ0/ref=as_li_ss_il?ie=UTF8&linkCode=li3&tag=cafemanawe00d-22&linkId=ad9a535979498adc41beccb4fb5c42b9'
    dri.save
  end
end
