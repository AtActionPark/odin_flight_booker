# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

airports = {"CDG" => "Charles de Gaulle",
              "ORY" => "Orly",
              "BVA" => "Beauvais-Tillé",
              "AMP" => "Marseille",
              "NCE" => "Nice",
              "LON" => "London",
              "CPH" => "Copenhagen"}

airports.each do |code, name|
  Airport.create(code: code, name: name)
end

flights = [{departure_airport_id: 1,
            arrival_airport_id: 6,
            departure_date: DateTime.new(2015,6,7, 12,0),
            duration: 60 },
            {departure_airport_id: 1,
            arrival_airport_id: 6,
            departure_date: DateTime.new(2015,6,7, 14,0),
            duration: 60 },

            {departure_airport_id: 1,
            arrival_airport_id: 7,
            departure_date: DateTime.new(2015,6,8),
            duration: 60 },

            {departure_airport_id: 2,
            arrival_airport_id: 4,
            departure_date: DateTime.new(2015,6,9),
            duration: 60 },

            {departure_airport_id: 2,
            arrival_airport_id: 5,
            departure_date: DateTime.new(2015,6,10),
            duration: 60 },

            {departure_airport_id: 3,
            arrival_airport_id: 6,
            departure_date: DateTime.new(2015,6,11),
            duration: 60 }
          ]


flights.each do |flight|
  Flight.create(flight)
end
