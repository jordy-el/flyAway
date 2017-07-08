class FlightsController < ApplicationController
  def index
    if params[:search] == "t"
      @origin = Airport.find_by(location: params[:origin])
      @destination = Airport.find_by(location: params[:destination])
      @flights = Flight.where(origin: @origin)
      if @destination
        @flights = @flights.where(destination: @destination)
      end
    else
      @flights = Flight.all
    end
    if @flights.empty?
      flash[:error] = "We found nothing matching your search criteria"
      redirect_to root_url
    end
    @flights = @flights.order(:departing)
    @airports = Airport.all
  end
end
