class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new]

  def index
    @pets = policy_scope(Pet)
  end

  def edit
    @pet = Pet.last
    render :new
    authorize @pet
  end

  def update
    @pet = Pet.find(params[:id])
    authorize @pet
    if @pet.update(params.require(:pet).permit(:name, :species, :price))
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    redirect_to pets_path(@pet)
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
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def pet_params
    params.require(:pet).permit([:name, :species, :price, :photo])
  end
end
