class PetsController < ApplicationController
  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
  end

  private

  def pet_params
    params.require(:pet).permit(:name)
  end
end
