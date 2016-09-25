=begin
http://pdf.th7.cn/down/files/1502/Practical%20Object-Oriented%20Design%20in%20Ruby.pdf
CHAPTER 6 - Acquiring Behavior Through Inheritance, Implementing Every Template Method pg. 128-129
=end


class Bicycle
  attr_reader :size, :chain, :tire_size
  
  def initialize(args={})                 # <- WHY THE args={} ???
    @size      = args[:size]
    @chain     = args[:chain]     || default_chain
    @tire_size = args[:tire_size] || default_tire_size
  end

  def default_chain                 # <- COMMON DEFAULT
    '10-speed'
  end

  def default_tire_size
    raise NotImplementedError,                    # <- This might be sufficient (without ",")
          "This #{self.class} cannot respond to:" # <- But this can add more information 
  end
end



class RoadBike < Bicycle
  attr_reader :tape_color

  def initialize(args)
    @tape_color = args[:tape_color]
    super(args)
  end

  def default_tire_size             # <- SUBCLASS DEFAULT        
    '23'
  end

  # def spares
    # { tape_color:   tape_color}   # <- concrete - only RoadBikes have tape_color
  # end

  # ...
end



class MountainBike < Bicycle
  attr_reader :front_shock, :rear_shock

  def initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock  = args[:rear_shock]
    super(args)
  end

  def default_tire_size             # <- SUBCLASS DEFAULT
    '2.1'
  end

  # def spares
    # super.merge({rear_shock: rear_shock})  #<- what are the curlies doing?
  # end
end


class RecumbentBike < Bicycle
  def default_chain
    '9-speed'
  end
end

bent = RecumbentBike.new # <- NotImplementedError


# road_bike = RoadBike.new(
              # size:        'M',
              # tape_color:  'red' )

# puts road_bike.tire_size            # => '23'
# puts road_bike.chain                # => "10-speed"
# puts

# mountain_bike = MountainBike.new(
                  # size:         'S',
                  # front_shock:  'Manitou',
                  # rear_shock:   'Fox')

# puts mountain_bike.tire_size        # => '2.1'
# puts mountain_bike.chain            # => "10-speed"
# puts

# puts road_bike.inspect.split(' ')
# puts
# puts mountain_bike.inspect.split(' ')
# puts

