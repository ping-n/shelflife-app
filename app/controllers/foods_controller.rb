class FoodsController < ApplicationController
  before_action :set_food, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @fridges = current_user.fridges.includes(location: [:foods])
    @foods = Food.where(user: current_user)
  end

  def show; end

  def new
    @food = Food.new
  end

  def edit; end

  def create
    @food = current_user.foods.create(food_params)
    if @food.errors.any?
      render :new
    else
      flash[:success] = 'You successfully added a food!'
      redirect_to @food
    end
  end

  def update
  puts "UPDATE being called on FoodsController"
  puts "food_params = #{food_params}"
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

  def set_food
    @food = Food.find(params[:id])
  end
end
