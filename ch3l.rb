=begin
http://pdf.th7.cn/down/files/1502/Practical%20Object-Oriented%20Design%20in%20Ruby.pdf
Chapter 3. Managing Dependencies, Understanding Dependencies pg.52
=end

# Reversing the dependency so "Wheel" depends on "Gear" or "ratio"

class Gear
  attr_reader :chainring, :cog
  def initialize(chainring, cog)
    @chainring = chainring
    @cog       = cog
  end
  
  def gear_inches(diamete)
    ratio * diameter
  end
  
  def ratio
    chainring / cog.to_f
  end
# ...
end

class Wheel
  attr_reader :rim, :tire, :gear
  def initialize(rim, tire, chainring, cog)
    @rim       = rim
    @tire      = tire
    @gear      = Gear.new(chainring, cog)
  end
  
  def diameter
    rim + (tire * 2)
  end
  
  def gear_inches
    gear.gear_inches(diameter)
  end
# ...
end

puts Wheel.new(26, 1.5, 52, 11).gear_inches


