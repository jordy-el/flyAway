class FlightsController < ApplicationController
  def index
    if params[:search] == "t"
      @origin = Airport.find_by(location: params[:origin])
      @destination = Airport.find_by(location: params[:destination])
      @flights = Flight.where(origin: @origin, destination: @destination)
    else
      @flights = Flight.all
    end
    @airports = Airport.all
  end
end
