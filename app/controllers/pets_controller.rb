class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new]

  def index
    @pets = policy_scope(Pet)
  end

  def edit
    authorize @pet
  end

  def update
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
    @pets = Pet.all
    authorize @pets
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    authorize @pet
  end

  private

  def pet_params
    params.require(:pet).permit(:name)
  end
end
