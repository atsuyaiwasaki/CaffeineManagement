class SessionController < ApplicationController

  def create
      user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])
  # request.env['omniauth.auth']に、OmniAuthによってHashのようにユーザーのデータが格納されている

      session[:user_hash] = user.add_hash
    if user.weght.present?
      redirect_to root_path, alert: 'こんにちは'
    else
      redirect_to controller: 'new_ac' , action: 'setWei'
      #flash[alert:]  = 'がログインしました
      #@user = user
    end
      #gon.name_list=User.find(1)

      #@userName=user.find_by(id:2).name
      #@userLog = user.user_drinks.all
  end
  def delete
      session.delete(:user_hash)
      #redirect_to root_path, alert: 'ログアウトしました' # action: 'newAc'
      redirect_to controller: 'new_ac', action: 'newAc'
      #flash[alert:]  = 'ログアウトしました'
  end

end
