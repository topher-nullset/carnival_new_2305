class Carnival
  attr_reader :duration, :rides

  def initialize(duration, rides)
    @duration = duration
    @rides = rides
  end

  def most_popular_ride
    rides.max_by { |ride| ride.rider_log.values.sum }
  end
end