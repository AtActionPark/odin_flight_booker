class FlightsController < ApplicationController

  def index
    @departure_options = Airport.all.map{|u| [u.code, u.id]}
    @arrival_options = Airport.all.map{|u| [u.code, u.id]}
    @date_options = Flight.date_list

    @departure = params[:departure]
    @arrival = params[:arrival]
    @passengers = params[:passengers]
    @date = params[:date]

    @flights = Flight.search(@departure, @arrival, @date)


  end

end
