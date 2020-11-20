class Api::SurvivorsController < ApplicationController
  def create
    survivor = Survivor.new(survivor_params)
    inventory = survivor.build_inventory(inventory_params)

    if survivor.save && inventory.save
      render json: SurvivorSerializer.new(survivor), status: :created
    else
      render json: { errors: build_errors_messages_to(survivor, inventory) },
             status: :unprocessable_entity
    end
  end

  private

  def build_errors_messages_to(survivor, inventory)
    errors = {}
    errors.merge!(survivor.errors) if survivor.invalid?
    errors.merge!({ items: humanize_errors(inventory) }) if inventory.invalid?
    errors
  end

  def humanize_errors(model)
    [model.errors.each_with_object({}) { |(attribute, error), hash| hash[attribute] = "Quantity #{error}" }]
  end

  def inventory_params
    params[:survivor].require(:inventory).permit(:water, :food, :medication, :ammunition)
  end

  def survivor_params
    params.require(:survivor).permit(:name, :age, :gender, :latitude, :longitude)
  end
end
