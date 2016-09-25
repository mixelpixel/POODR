=begin
http://pdf.th7.cn/down/files/1502/Practical%20Object-Oriented%20Design%20in%20Ruby.pdf
CHAPTER 6 - Acquiring Behavior Through Inheritance, Misapplying Inheritance pg. 115-116
=end


# NOTE: back to the first implementation of Bicycle
class Bicycle
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
    super(args)  # <-- NOTE: inherits args from SUPER-class
  end

  def spares
    super.merge(rear_shock: rear_shock)
  end
end


mountain_bike = MountainBike.new(
                  size: 'S',
                  front_shock: 'Manitou',
                  rear_shock: 'Fox')

mountain_bike.size # -> 'S'

mountain_bike.spares
# -> {:tire_size => "23", <- wrong!
#     :chain => "10-speed",
#     :tape_color => nil, <- not applicable
#     :front_shock => 'Manitou',
#     :rear_shock => "Fox"}

puts 'mountain_bike.spares are: ' + mountain_bike.spares.to_s

puts 'mountain_bike is: ' + mountain_bike.to_s
puts 'mountain_bike.class is: ' + mountain_bike.class.to_s
puts 'mountain_bike.size is: ' + mountain_bike.size.to_s
puts "mountain_bike.tape_color is nil?: #{mountain_bike.tape_color.class.to_s}"

