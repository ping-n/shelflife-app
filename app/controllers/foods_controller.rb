class FoodsController < ApplicationController
  before_action :set_food, only: %i[show update destroy]

  def index
    @foods = Food.where(user: current_user)
  end

  def show; end

  def new
    @food = Food.new
  end

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
    if @food.update(food_params)
      redirect_to @food
    else
      render :edit
    end
  end

  def destroy
    @food.destroy
  end

  private

  def food_params
    params.require(:foods).permit(
      :name, 
      :opened, 
      :expiry, 
      :expiry_after_open, 
      :volume, 
      :user_id, 
      :location_id
    )
  end

  def set_food
    @food = Food.find(params[:id])
  end
end
