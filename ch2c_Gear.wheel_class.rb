=begin
http://pdf.th7.cn/down/files/1502/Practical%20Object-Oriented%20Design%20in%20Ruby.pdf
Chapter 2: Designing Classes with a Single Responsibility, pg.20
=end

# A Class with a single responsibility and an enhancement of wheel_diameter
=begin
    You show your Gear calculator to a cyclist friend and she finds it useful but immediately
asks for an enhancement. She has two bicycles; the bicycles have exactly the
same gearing but they have different wheel sizes. She would like you to also calculate
the effect of the difference in wheels.
    A bike with huge wheels travels much farther during each wheel rotation than
one with tiny wheels
=end

class Gear
  attr_reader :chainring, :cog, :rim, :tire
  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog       = cog
    @rim       = rim
    @tire      = tire
  end
  
  def ratio
    chainring / cog.to_f
  end
  
  def gear_inches
      # tire goes around rim twice for diameter
    ratio * (rim + (tire * 2))
  end
end

puts Gear.new(52, 11, 26, 1.5).gear_inches
# -> 137.090909090909

puts Gear.new(52, 11, 24, 1.25).gear_inches
# -> 125.272727272727

# NOTE: the previous method now does not work
# puts Gear.new(52, 11).ratio
# ArgumentError


