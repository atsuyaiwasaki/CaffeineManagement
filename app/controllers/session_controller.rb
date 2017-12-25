class SessionController < ApplicationController
  def create
      user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])
  # request.env['omniauth.auth']に、OmniAuthによってHashのようにユーザーのデータが格納されている

      session[:user_hash] = user.add_hash
      #session
      @userN = user.nickname

      print("DEbuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuud")
      print (@userN)
      redirect_to root_path, alert: 'がログインしました'
      #@user = user

      #gon.name_list=User.find(1)

      #@userName=user.find_by(id:2).name
      #@userLog = user.user_drinks.all
    end
    def delete
      session.delete(:user_hash)
      redirect_to root_path, alert: 'ログアウトしました'
    end
end
