class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @passengers = params[:passengers]
    @booking = Booking.new
    @passengers.to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      @booking.update_attribute(:flight_id, params[:flight_id])
      @booking.set_ref_number
      mail_users(@booking)
      flash[:success] = "trip booked"
      redirect_to booking_path(@booking)
    else
      @flight  = Flight.find(params[:flight_id])
      render 'new'
    end

  end

  def show
    @booking = Booking.find(params[:id])
  end

  private
    def booking_params
      params.require(:booking).permit(passengers_attributes: [:name, :email])
    end

    def mail_users (booking)
      booking.passengers.each do |p|
        PassengerMailer.welcome_email(p).deliver_now
      end
    end

end
