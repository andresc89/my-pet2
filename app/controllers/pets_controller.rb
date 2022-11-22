class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new]

  def index
    @pets = policy_scope(Pet)
  end

  def edit
    authorize @pet
  end

  def update
    @pet = Pet.find(pet_params)
    authorize @pet
  end

  def destroy
    authorize @pet
  end

  def new
    @pet = Pet.new
    authorize @pet
  end

  def show
    @pet = Pet.find(params[:id])
    authorize @pet
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    authorize @pet
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :id)
  end
end
