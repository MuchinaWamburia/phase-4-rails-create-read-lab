class PlantsController < ApplicationController
  wrap_parameters format: []

  #Get/plants
  def index
    plants =Plant.all
    render json: plants
  end
  
  def show 
    plants =Plant.find_by(id: params[:id])
    if plant
      render json: plant
    else 
      render json: {error: "Plant not found"},
      status: :not_found
    end
  end

 # POST/plants
  def create
    plants =Plant.create (plants_params) #(params.permit(:name, :species))
    render json: plants, status: :created
  end

  private

  def plants_params
      params.permit(:name, :image, :price)
  end

  
end