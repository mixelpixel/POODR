=begin
http://pdf.th7.cn/down/files/1502/Practical%20Object-Oriented%20Design%20in%20Ruby.pdf
CHAPTER 5 - Reducing Costs with Duck Typing pg.88-89
=end

# Trip preparation becomes more complicated
class Trip
  attr_reader :bicycles, :customers, :vehicle
  
  def prepare(preparers)
    preparers.each {|preparer|
      case preparer
      when Mechanic
        preparer.prepare_bicycles(bicycles)
      when TripCoordinator
        preparer.buy_food(customers)
      when Driver
        preparer.gas_up(vehicle)
        preparer.fill_water_tank(vehicle)
      end
    }
  end
end

# when you introduce TripCoordinator and Driver
class TripCoordinator
  def buy_food(customers)
    # ...
  end
end

class Driver
  def gas_up(vehicle)
    # ...
  end
  
  def fill_water_tank(vehicle)
    # ...
  end
end

