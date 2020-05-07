class FridgesController < ApplicationController
<<<<<<< HEAD
  def index
    @fridges = Fridge.where(user: current_user)
=======
  before_action :set_fridge, only: %i[show]
  before_action :authenticate_user!

  def show; end

  def new
    @fridge = Fridge.new
  end

  def create
    @fridge = current_user.fridges.create(fridge_params)
    if @fridge.errors.any?
      render :new
    else
      flash[:success] = 'You successfully added a fridge'
      redirect_to root_path
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
>>>>>>> c2eee557b464fd78c452511f44322fa88d7de8d2
  end
end
