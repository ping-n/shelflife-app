class FridgesController < ApplicationController
  before_action :set_fridge, only: %i[show edit update]
  before_action :authenticate_user!

  def show; end

  def new
    @fridge = Fridge.new
  end

  def edit; end

  def create
    @fridge = current_user.fridges.create(fridge_params)
    if @fridge.errors.any?
      render :new
    else
      flash[:success] = 'You successfully added a fridge'
      redirect_to root_path
    end
  end

  def update
    if @fridge.update(fridge_params)
      redirect_to @fridge
    else
      render :edit
    end
  end

  private

  def fridge_params
    params.require(:fridge).permit(
      :name,
      :user_id
    )
  end

  def set_fridge
    @fridge = Fridge.find(params[:id])
  end
end
