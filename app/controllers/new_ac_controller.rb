class NewAcController < ApplicationController
  def newAc
    render:layout => 'newsetup'
    #redirect_to root_path, alert: 'がログインしました'
  end
  def setWei

  end
  def dataSet
    require 'json'
    require 'uri'
    require 'net/https'

    loginSettingUser = User.find_by(add_hash: session[:user_hash])

   # uri = URI.parse('/drinkLogSet')
   #  json = Net::HTTP.get(uri)
   #  result　= JSON.parse(json)
   #  puts result
    weightdata = params[:wei] #result['d_id'].to_s
    agedata = params[:age]#後日実装
    loginSettingUser.weght = weightdata
    loginSettingUser.save
    redirect_to controller: 'drinks', action: 'index'
  end
end
