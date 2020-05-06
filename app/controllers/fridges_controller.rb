class FridgesController < ApplicationController
  #   before_action :set_fridge, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def new
    @fridge = Fridge.new
  end

  def create
    @fridge = current_user.fridges(fridge_params)
    if @fridge.errors.any
      render :new
    else
      flash[:success] = 'You successfully added a fridge'
      redirect_to root_path
    end
  end

  private

  def fridge_params
    params.require(:food).permit(
      :name,
      :user_id
    )
  end
end
