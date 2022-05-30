# frozen_string_literal: true

class BookingsController < ApplicationController
  def new
    qty = params[:booking][:passengers].to_i
    @bookings = qty.times.map { Booking.new }
    @passengers = qty.times.map { Passenger.new }
    @flight = Flight.find(params[:booking][:flight].to_i)
  end

  def create
    @bookings = params[:bookings].map do |booking|
      Booking.new(booking.permit(:passenger_id, :flight_id))
    end
    if @bookings.all?(&:valid?)
      @bookings.each(&:save!)
      redirect_to root_path, notice: 'Bookings created successfully'
    else
      redirect_to root_path, status: :unprocessable_entity, alert: 'Bookings not created'
    end
  end

  private

  def booking_params
    params.require(:booking).permit!
  end
end
