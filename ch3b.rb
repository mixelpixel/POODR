=begin
http://pdf.th7.cn/down/files/1502/Practical%20Object-Oriented%20Design%20in%20Ruby.pdf
Chapter 3. Managing Dependencies, Understanding Dependencies pg.39
=end

class Gear
  attr_reader :chainring, :cog, :rim, :tire
  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog       = cog
    @rim       = rim
    @tire      = tire
  end

  def ratio                 # ADDED TO MAKE script functional
    chainring / cog.to_f    # ADDED TO MAKE script functional
  end                       # ADDED TO MAKE script functional
  
  def gear_inches
    ratio * Wheel.new(rim, tire).diameter
  end
# ...
end


class Wheel                 # ADDED THIS CLASS TO MAKE script functional
  attr_reader :rim, :tire   
  def initialize(rim, tire)
    @rim       = rim
    @tire      = tire
  end

  def diameter
    rim + (tire * 2)
  end
  
  def circumference
    diameter * Math::PI
  end
end


puts Gear.new(52, 11, 26, 1.5).gear_inches

