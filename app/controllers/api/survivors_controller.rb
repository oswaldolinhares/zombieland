class Api::SurvivorsController < ApplicationController

  def create
    survivor = Survivor.new(survivor_params)
    survivor.build_inventory(inventory_params)
    if survivor.save
      render json: SurvivorSerializer.new(survivor), status: :created
    end

  end

  private

  def inventory_params
    params[:survivor].require(:inventory).permit(:water, :food, :medication, :ammunition)
  end

  def survivor_params
    puts params
    params.require(:survivor).permit(:name, :age, :gender, :latitude, :longitude)
  end
end
