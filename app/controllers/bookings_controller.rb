class BookingsController < ApplicationController

  # GET /bookings/new
  def new
    @price = rand(150) + 150
    @booking = Booking.new
    @flight = Flight.find(params[:flight])
    @passenger = Passenger.new
    @ticket = Ticket.new(price: @price)
  end

  # POST /bookings
  def create
    @passengers = []
    @flight = Flight.find(params[:flight].to_i)
    @booking = Booking.create
    @bill = Bill.new(address: params["bill"][":address"], phone: params["bill"][":phone"], email: params["bill"][":email"])
    @booking.bill = @bill
    @bill.save!
    passenger_params.each do |passenger|
      unless passenger[":name"] == ""
        @passengers << Passenger.create(name: passenger[":name"])
      end
    end
    @passengers.each do |passenger|
      ticket = Ticket.new(price: rand(150) + 150)
      ticket.flight = @flight
      ticket.passenger = passenger
      ticket.booking = @booking
      ticket.save!
    end
    if @booking.save! && @flight.seats >= @passengers.length
      @flight.seats = @flight.seats - @passengers.length
      @flight.save!
      BookingMailer.booking_email(@booking).deliver_now!
      redirect_to booking_url(@booking)
    else
      redirect_to new_booking_url(flight: @flight.id)
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.fetch(:booking, {})
    end

    def passenger_params
      params.permit![:passengers]
    end

    def bill_params
      params.require("bill").permit(":address", ":phone")
    end
end
