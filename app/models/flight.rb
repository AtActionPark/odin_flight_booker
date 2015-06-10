class Flight < ActiveRecord::Base
  belongs_to :from_airport, class_name: "Airport", foreign_key: "departure_airport_id"
  belongs_to :to_airport, class_name: "Airport", foreign_key: "arrival_airport_id"

  def self.date_list
    dates = Flight.all.order(departure_date: :asc)
    dates.map{|f| [f.departure_date.strftime("%d/%m/%Y") ]}.uniq
  end

  def self.search (departure, arrival, date)
    Flight.where(departure_airport_id: departure,
      arrival_airport_id: arrival,
      departure_date: Flight.correct_date(date))
  end
  
  def self.correct_date(date)
    unless date.nil?
      date = date.to_date
      date.beginning_of_day..date.end_of_day
    end
  end 
end
