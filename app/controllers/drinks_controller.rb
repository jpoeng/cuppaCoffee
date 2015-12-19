class DrinksController < ApplicationController
  before_action :set_drink, only: [:show, :edit, :update, :destroy]

  def search
    @drinks = Drink.where(name: params[:name])
    render 'index'
  end

  # GET /drinks
  # GET /drinks.json
  def index
    @users = User.all
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end

    if params[:brand]
      @drinks = Drink.where(brand: params[:brand])
    else
    # By default this renders index
      @drinks = Drink.all
    end
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
    @drink.user_id = current_user.id if current_user

    respond_to do |format|
      if @drink.save
        flash[:success] = 'Drink was successfully created.'
        format.html { redirect_to @drink }
      # if @drink.save
      #   format.html { redirect_to @drink, notice: 'Drink was successfully created.' }
        format.json { render :show, status: :created, location: @drink }
      else
        flash[:danger] = 'There was a problem creating the Drink.'
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
        flash[:success] = 'Drink was successfully updated.'
        format.html { redirect_to @drink }
      # if @drink.update(drink_params)
      #   format.html { redirect_to @drink, notice: 'Drink was successfully updated.' }
        format.json { render :show, status: :ok, location: @drink }
      else
        flash[:danger] = 'There was a problem updating the Drink.'
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
      flash[:success] = 'Drink was successfully destroyed.'
      format.html { redirect_to drinks_url }
    # respond_to do |format|
    #   format.html { redirect_to drinks_url, notice: 'Drink was successfully destroyed.' }
    #   format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drink
      @drink = Drink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drink_params
      params.require(:drink).permit(:name, :cups, :brand)
    end
end
