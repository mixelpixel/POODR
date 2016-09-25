=begin
http://pdf.th7.cn/down/files/1502/Practical%20Object-Oriented%20Design%20in%20Ruby.pdf
CHAPTER 5 - Reducing Costs with Duck Typing pg.93-94
NOTE see figure 5.4
=end

# Trip preparation becomes easier
class Trip
  attr_reader :bicycles, :customers, :vehicles
  
  def prepare(preparers)
    preparers.each {|preparer|
      preparer.prepare_trip(self)}
  end
end

# when every preparer is a Duck
# that responds to 'prepare_trip'
class Mechanic
  def prepare_trip(trip)
    trip.bicycles.each {|bicycle|
      prepare_bicycle(bicycle)}
  end
  
  # ...
end

class TripCoordinator
  def prepare_trip(trip)
    buy_food(trip.customers)
  end
  
  # ...
end

class Driver
  def prepare_trip(trip)
    vehicle = trip.vehicle
    gas_up(vehicle)
    fill_water_tank(vehicle)
  end
  # ...
end

