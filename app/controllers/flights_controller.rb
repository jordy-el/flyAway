class FlightsController < ApplicationController
  def index
    if params[:search] == "t"
      @origin = Airport.find_by(location: params[:origin])
      @destination = Airport.find_by(location: params[:destination])
      @flights = Flight.where(origin: @origin)
      if @destination
        @flights = @flights.reject { |flight| flight.destination != @destination }
      end
    else
      @flights = Flight.all
    end
    @flights = @flights.order(:departing)
    @airports = Airport.all
  end
end
