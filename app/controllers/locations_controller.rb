class LocationsController < ApplicationController
  before_action :set_fridge
  before_action :authenticate_user!

  def create
    @location = @fridge.location.create(location_params)
    if @location.errors.any?
      render :new
    else
      flash[:success] = 'Added fridge location'
      redirect_to fridge_path(@fridge)
    end
  end

  def destroy
    @location = @fridge.location.find(params[:id])
    @location.destroy
    redirect_to @fridge
  end

  private

  def location_params
    params.require(:location).permit(:name, :volume)
  end

  def set_fridge
    @fridge = Fridge.find(params[:fridge_id])
  end
end
