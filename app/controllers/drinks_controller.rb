class DrinksController < ApplicationController
  before_action :set_drink, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # GET /drinks
  # GET /drinks.json

  def index
    #find_by

    @LoginUser = User.find_by(add_hash: session[:user_hash])

    #@t = @LoginUser.UserDrink.Dirnk.find_by(10)
    @users = User.all
    @drinks = Drink.all
    @userDrinkLog = @LoginUser.drinks.all
    #gon.name_list=Drink.find(10);

  end
  # def drinkLogSet
  #   require 'json'
  #   require 'uri'
  #   require 'net/http'
  #
  #   #uri = URI.parse('')
  #   json = Net::HTTP.get(uri)
  #   result　= JSON.parse(json)
  #   #puts result
  #   #@drink_id= result['d_id'].to_s
  #   #UserDrink.created_by(user_id:@LoginUser.user_id,drink_id:@drink_id)
  #
  # end
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
