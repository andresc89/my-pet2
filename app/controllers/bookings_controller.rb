class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def new
    @user = current_user
    @pet = Pet.find(params[:pet_id])
    @booking = Booking.new
    authorize @booking
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @pet = Pet.find(params[:pet_id])
    @booking.user = current_user
    @booking.pet = @pet
    authorize @booking
    if @booking.save
      redirect_to pet_booking_path(@pet, @booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @bookings = policy_scope(Booking)
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    if @booking.update(params.require(:booking).permit(:start_date, :end_date))
      redirect_to pet_path(@pet) # ALTERAR ISTO????
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path(@booking)
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit([:start_date, :end_date])
  end
end
