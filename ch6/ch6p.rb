=begin
http://pdf.th7.cn/down/files/1502/Practical%20Object-Oriented%20Design%20in%20Ruby.pdf
CHAPTER 6 - Acquiring Behavior Through Inheritance, Decoupling Subclasses Using Hook Messages pg. 135-136
=end


class Bicycle
  attr_reader :size, :chain, :tire_size
  
  def initialize(args={})                             # <- WHY THE HASH FOR args={} ???
    @size      = args[:size]
    @chain     = args[:chain]     || default_chain
    @tire_size = args[:tire_size] || default_tire_size
    
    post_initialize(args)             # Bicycle both sends...
  end
  
  def post_initialize(args)           # ...and implements this
    nil
  end

  def spares
    { tire_size:  tire_size,
      chain:      chain}.merge(local_spares)    # <- MERGE
  end
  
  # HOOK for subclasses to override              # HOOK
  def local_spares                               # HOOK
    {}                                           # HOOK
  end                                            # HOOK
  
  def default_chain
    '10-speed'
  end

  def default_tire_size
    raise NotImplementedError,
          "This #{self.class} cannot respond to:"
  end
end



class RoadBike < Bicycle
  attr_reader :tape_color

  # def initialize(args)                 # GONE
    # @tape_color = args[:tape_color]    # GONE
    # super(args)                        # GONE
  # end                                  # GONE
  
  def post_initialize(args)           # RoadBike can
    @tape_color = args[:tape_color]   # optionally
  end                                 # override it
  
  def local_spares
    {tape_color: tape_color}          # "LOCALS ONLY, BRAH!"
  end

  # def spares                                   # NO MAS
    # super.merge({ tape_color:   tape_color})   # NO MAS
  # end                                          # NO MAS

  def default_tire_size
    '23'
  end
end



class MountainBike < Bicycle
  attr_reader :front_shock, :rear_shock

  def initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock  = args[:rear_shock]
    super(args)
  end

  def spares
    super.merge({rear_shock: rear_shock})
  end
  
  def default_tire_size
    '2.1'
  end
end



class RecumbentBike < Bicycle
  attr_reader :flag
  
  def initialize(args)
    @flag = args[:flag]
    super(args)
  end
  
  def spares
    super.merge({flag: flag})
  end
  
  def default_chain
    '9-speed'
  end
  
  def default_tire_size
    '28'
  end
end



# bent = RecumbentBike.new(flag: 'tall and orange')
# puts bent.spares.to_s.split(', ')
# -> {:tire_size => nil, <- didn't get initialized
#     :chain     => nil, 
#     :flag      => 'tall and orange'}



road_bike = RoadBike.new(
              size:        'M',
              tape_color:  'red' )

puts road_bike.tire_size            # => '23'
puts road_bike.chain                # => "10-speed"
# puts

# mountain_bike = MountainBike.new(
                  # size:         'S',
                  # front_shock:  'Manitou',
                  # rear_shock:   'Fox')

# puts mountain_bike.tire_size        # => '2.1'
# puts mountain_bike.chain            # => "10-speed"
# puts mountain_bike.spares
# puts

puts road_bike.inspect.split(' ')
puts
# puts mountain_bike.inspect.split(' ')
# puts

