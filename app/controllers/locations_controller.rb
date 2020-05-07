class LocationsController < ApplicationController
    before_action :authenticate_user!

    def create
        @fridge = Fridge.find(params[:fridge_id])
        @location = @fridge.location.create(location_params)
        if @location.errors.any?
            render :new
        else
            flash[:success] = 'Added fridge location'
            redirect_to fridge_path(@fridge)
        end
    end

    private
    def location_params
        params.require(:location).permit(:name,:volume)
    end
end
