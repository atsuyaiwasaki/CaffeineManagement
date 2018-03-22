class DrinksController < ApplicationController
  before_action :set_drink, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # GET /drinks
  # GET /drinks.json
  def index
    require 'str_to_hash'

    timelist = {}
    for num in 0..24 do
      timelist.store(num,0)
    end

    gon.timelist = timelist
    @LoginUser = User.find_by(add_hash: session[:user_hash])
    #@t = @LoginUser.UserDrink.Dirnk.find_by(10)
    #@users = User.all
    @drinks = Drink.all.limit(5)
    @userDrinkLog = @LoginUser.user_drinks.all
    # @userDrinkLog = @LoginUser.user_drinks.where(created_at:today)
    userweight = @LoginUser.weght
    gon.userCaffeinDayMax = userweight * 5.7
    gon.userCaffeinOneTimeMax = userweight * 3
    safeline = userweight * 3
    today = 0.day.ago.all_day
    yesterday =1.day.ago.all_day
    #drinkdata = @LoginUser.user_drinks.all.where(created_at:today)
    drinkdata = @userDrinkLog.order(created_at:"DESC").where(created_at:today)
    @todaylog = drinkdata
    #gon.drinkdata = drinkdata.all
    puts "-----------DataCheck---------------"
    sentdata = Hash.new({})
    dataList = []
    i =0;
    drinkdata.each do |driData|
      sentdata[i]["timeh"] = driData.created_at.strftime("%H")
      sentdata[i]["name"] = driData.drink.name
      sentdata[i]["cafeinamount"] = driData.drink.cafeinamount
      #------jsで記述したカフェインの代謝計算-------
      maxtime = sentdata[i]["timeh"].to_i
      setcafeMAX = sentdata[i]["cafeinamount"]+timelist[maxtime+1]

      setcafehalf =setcafeMAX/2
      dec1h =  setcafehalf/6
      passh = 1
      boo = true
        while boo do
          over24 = maxtime+passh
          if over24 > 24
           break
          end

          if passh==1
            timelist[maxtime+1] = setcafeMAX
            passh += 1

          elsif passh >1 && passh < 6 && timelist[maxtime+passh]>= 0
            set = timelist[maxtime+passh-1]-dec1h
            timelist[maxtime+passh] = set
            passh += 1

          else timelist[maxtime+passh]>=0
            set = timelist[maxtime+passh-1]-dec1h/2
            timelist[maxtime+passh] = set

            if timelist[maxtime+passh]<0
              timelist[maxtime+passh] =0
              break
            end
            passh +=1
        end
      end
      #timelist[maxtime+1] += setcafeMAX/
      kakunin1 = sentdata[i].to_s
      dataList.push(kakunin1.to_h)
      i+=1
    end

    #@D103 = Drink.find_by(id:104)
    gon.drinkdataset = dataList
    #puts drinkdata.drink.name
    #gon.name_list=Drink.find(10);
    # testLog = DateTime.now.to_s(:time)
    #gon.testLog.to_s(:time)
    testLog = DateTime.now
    nowstrh = testLog.strftime("%H")
    gon.testLogHour = nowstrh
    nowinth = nowstrh.to_i
    poor = safeline-timelist[nowinth+1]
    gon.poor = poor
    @num = poor
   end
   def  select
     require 'uri'
     require 'net/http'
     testdata = params[:test]
     puts "test--------------------test---------"
     puts testdata
     @testdata = testdata
     gon.testpass = testdata
     redirect_to controller: 'drinks' , action:'index'
   end
   def drinkLogDel
     require 'json'
     require 'uri'
     require 'net/http'

     @LoginUser = User.find_by(add_hash: session[:user_hash])
     u_id = @LoginUser.id
     drink_id = params[:d_id]
     User.find(u_id).user_drinks.last.destroy

   end
   def drinkLogSet
     require 'json'
     require 'uri'
     require 'net/http'

     @LoginUser = User.find_by(add_hash: session[:user_hash])
     puts "------------put---------------"
     puts @LoginUser.id
     u_id = @LoginUser.id

    # uri = URI.parse('/drinkLogSet')
    #  json = Net::HTTP.get(uri)
    #  result　= JSON.parse(json)
    #  puts result
     drink_id = params[:d_id] #result['d_id'].to_s
     UserDrink.create(user_id:u_id,drink_id:drink_id)
  #
   end
  # GET /drinks/1
  # GET /drinks/1.json

  def show

  end

  # GET /drinks/new
  def new
    @drink = Drink.new
    redirect_to action: new
  end

  # GET /drinks/1/edit
  def edit
  end

  # POST /drinks
  # POST /drinks.json
  def create
    @drink = Drink.new(drink_params)

    respond_to do |format|
      if @drink.save
        format.html { redirect_to @drink, notice: 'Drink was successfully created.' }
        format.json { render :show, status: :created, location: @drink }
      else
        format.html { render :new }
        format.json { render json: @drink.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drinks/1
  # PATCH/PUT /drinks/1.json
  def update
    respond_to do |format|
      if @drink.update(drink_params)
        format.html { redirect_to @drink, notice: 'Drink was successfully updated.' }
        format.json { render :show, status: :ok, location: @drink }
      else
        format.html { render :edit }
        format.json { render json: @drink.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drinks/1
  # DELETE /drinks/1.json
  def destroy
    @drink.destroy
    respond_to do |format|
      format.html { redirect_to drinks_url, notice: 'Drink was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drink
      @drink = Drink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drink_params
      params.require(:drink).permit(:name, :cafeinAmount, :Amount)
    end
    def newAc

    end


end
