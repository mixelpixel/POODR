=begin
http://pdf.th7.cn/down/files/1502/Practical%20Object-Oriented%20Design%20in%20Ruby.pdf
CHAPTER 6 - Acquiring Behavior Through Inheritance, Creating an Abstract Superclass pg. 119-120
=end


class Bicycle
end


class RoadBike < Bicycle
  attr_reader :size, :tape_color

  def initialize(args)
    @size       = args[:size]
    @tape_color = args[:tape_color]
  end

  # every bike has the same defaults for
  # tire and chain size
  def spares
    { chain:        '10-speed',
      tire_size:    '23',
      tape_color:   tape_color}
  end

  # Many other methods...
end


class MountainBike < Bicycle
  attr_reader :front_shock, :rear_shock

  def initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock  = args[:rear_shock]
#    super(args)  # <-- NOTE: NOTHING is inherited from SUPER-class
  end

  def spares
    super.merge(rear_shock: rear_shock)
  end
end



road_bike = RoadBike.new(
              size:        'M',
              tape_color:  'red' )

puts road_bike.size                         # => "M"


mountain_bike = MountainBike.new(
                  size:         'S',
                  front_shock:  'Manitou',
                  rear_shock:   'Fox')

puts mountain_bike.size                     # NoMethodError

