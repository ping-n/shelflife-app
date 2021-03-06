class FoodsController < ApplicationController
  before_action :set_food, only: %i[show edit update destroy]
  # before_action :set_location
  before_action :set_fridge
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @fridges = current_user.fridges.includes(location: [:foods])
    @expiring_foods = current_user.foods.select do |food|
      food.days_to_expiry <= 2 && food.days_to_expiry >= 0
    end
    @expired_foods = current_user.foods.select do |food|
      food.days_to_expiry.negative?
    end
    @foods = Food.where(user: current_user)
  end

  def show; end

  def new
    @food = Food.new
  end

  def edit; end

  def create
    @food = current_user.foods.create!(food_params)
    if @food.errors.any?
      render :new
    else
      flash[:success] = 'You successfully added a food!'
      redirect_to root_path
    end
  end

  def update
    if @food.update(food_params)
      redirect_to @food
    else
      render :edit
    end
  end

  def destroy
    @food.destroy
    redirect_to root_path
  end

  private

  def food_params
    params.require(:food).permit(
      :name,
      :opened,
      :expiry,
      :expiry_after_open,
      :volume,
      :user_id,
      :location_id,
      :picture
    )
  end

  def set_fridge
    return unless params[:fridge_id]

    @fridge = current_user.fridges.find(
      params[:fridge_id]
    )
  end

  def set_food
    @food = Food.find(params[:id])
  end
end
