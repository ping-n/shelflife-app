class FridgesController < ApplicationController
  #   before_action :set_fridge, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def new
    @fridge = Fridge.new
  end

  private

  def fridge_params
    params.require(:food).permit(
      :name,
      :user_id
    )
  end
end
