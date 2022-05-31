# frozen_string_literal: true

class BookingsController < ApplicationController
  def new
    qty = params[:booking][:passengers].to_i
    @bookings = qty.times.map { Booking.new }
    @passengers = qty.times.map { Passenger.new }
    @flight = Flight.find(params[:booking][:flight].to_i)
  end

  def create
    @bookings = booking_params.to_h.map do |key, booking|
      passenger = Passenger.find_by(email: booking[:passenger][:email]) || Passenger.create(booking[:passenger])
      Booking.new(passenger: passenger, flight: Flight.find(booking[:flight]))
    end
    if @bookings.all?(&:valid?)
      @bookings.each(&:save!)
      ids = @bookings.map(&:id)
      redirect_to bookings_checkout_path(ids: ids), notice: 'Bookings created successfully', ids: ids
    else
      redirect_to root_path, status: :unprocessable_entity, alert: @bookings.map(&:errors).map(&:full_messages).flatten.join(', ')
    end
  end

  def checkout
    @bookings = Booking.where(id: params[:ids].map(&:to_i))
  end

  private

  def booking_params
    params.require(:bookings).permit!
  end

  def checkout_params
    params.require(:ids)
  end
end
