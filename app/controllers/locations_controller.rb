class LocationsController < ApplicationController
  before_action :set_fridge
  before_action :authenticate_user!

  def edit
    # @location = @fridge.location.find(params[:location_id])
  end

  def create
    @location = @fridge.location.create(location_params)
    flash[:success] = 'Added fridge location'
    redirect_to fridge_path(@fridge)
  end

  def update
    @location = @fridge.location.find(params[:id])
    if @location.update(location_params)
      redirect_to @location
    else
      render :edit
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
