class DrinksController < ApplicationController
  before_action :set_drink, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  # GET /drinks
  # GET /drinks.json

  def index
    #find_by
    require 'str_to_hash'

    @LoginUser = User.find_by(add_hash: session[:user_hash])
    #@t = @LoginUser.UserDrink.Dirnk.find_by(10)
    @users = User.all
    @drinks = Drink.all
    @userDrinkLog = @LoginUser.user_drinks.all
    today = 0.day.ago.all_day
    yesterday =1.day.ago.all_day
    drinkdata = @LoginUser.user_drinks.where(created_at:today)
    #gon.drinkdata = drinkdata.all
    puts "-----------DataCheck---------------"
    sentdata = Hash.new({})
    dataList = []
    i =0;
    drinkdata.each do |driData|
      puts i
      sentdata[i]["timeh"] = driData.created_at.strftime("%H")
      puts sentdata[i]["timeh"]
      sentdata[i]["name"] = driData.drink.name
      puts driData.drink.cafeinAmount
      sentdata[i]["cafeinAmount"] = driData.drink.cafeinAmount
      kakunin1 = sentdata[i].to_s
      puts kakunin1.to_h
      dataList.push(kakunin1.to_h)
      i+=1
    end
    puts "-----------DataCheck2---------------"
    puts dataList
    gon.drinkdataset = dataList
    #puts drinkdata.drink.name
    #gon.name_list=Drink.find(10);
    # testLog = DateTime.now.to_s(:time)
    #gon.testLog.to_s(:time)
    testLog = DateTime.now
    gon.testLogHour = testLog.strftime("%H")
    # gon.testLogMin = testLog.strftime("%M")
    # gon.testLogSec = testLog.strftime("%S")
    #------------AWS-------------------------------------
    @res = Amazon::Ecs.item_search("検索",
        :search_index => 'Books',
        #BooksやDVDなど、検索したいものを search_index で指定
        :response_group => 'Medium',
        #response_group は、Small, Medium, Large が扱える
        :country => 'jp'
    )
  end

   def drinkLogDel
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
     User.find(u_id).user_drinks.last.destroy
  #
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
end
