=begin
http://pdf.th7.cn/down/files/1502/Practical%20Object-Oriented%20Design%20in%20Ruby.pdf
CHAPTER 6 - Acquiring Behavior Through Inheritance, Promoting Abstract Behavior pg. 121-122
=end


class Bicycle
  attr_reader :size        # <- promoted from RoadBike
  
  def initialize(args={})  # <- WHY THE args={} ???
    @size = args[:size]    # <- promoted from RoadBike
  end
end


class RoadBike < Bicycle
  attr_reader :tape_color  # <- :size removed

  def initialize(args)
    @tape_color = args[:tape_color]
    super(args)            # <- RoadBike now MUST send 'super'
  end                      # <- RoadBike is now a SUBCLASS of Bicycle

  # def spares
    # { chain:        '10-speed',
      # tire_size:    '23',
      # tape_color:   tape_color}
  # end

  # ...
end


class MountainBike < Bicycle
  attr_reader :front_shock, :rear_shock

  def initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock  = args[:rear_shock]
    super(args)            # <- MountainBike now MUST send 'super'
  end                      # <- MountainBike is now a SUBCLASS of Bicycle

  # def spares
    # super.merge(rear_shock: rear_shock)
  # end
end



road_bike = RoadBike.new(
              size:        'M',
              tape_color:  'red' )

puts road_bike.size                         # => "M"


mountain_bike = MountainBike.new(
                  size:         'S',
                  front_shock:  'Manitou',
                  rear_shock:   'Fox')

puts mountain_bike.size                     # => "S"

puts road_bike.inspect
puts mountain_bike.inspect



