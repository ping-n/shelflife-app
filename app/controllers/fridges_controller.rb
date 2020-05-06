class FridgesController < ApplicationController
  def index
    @fridges = Fridge.where(user: current_user)
  end
end
