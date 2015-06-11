class Booking < ActiveRecord::Base
  belongs_to :flight
  has_many :passenger_bookings
  has_many :passengers, through: :passenger_bookings
  accepts_nested_attributes_for :passengers
  @@counter = 0

  def get_flight 
    Flight.find(self.flight_id)
  end

  def set_ref_number
    ref_number = "#{self.flight.id}-#{self.flight.from_airport.code}-#{self.flight.to_airport.code}-#{@@counter}"

    @@counter+=1
    self.update_attribute(:number, ref_number)
  end
end

