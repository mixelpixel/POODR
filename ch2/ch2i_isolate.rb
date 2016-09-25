=begin
http://pdf.th7.cn/down/files/1502/Practical%20Object-Oriented%20Design%20in%20Ruby.pdf
Chapter 2: Designing Classes with a Single Responsibility, pg.32
=end

# Isolate Extra Responsibilities in Classes

class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog       = cog
    @wheel     = Wheel.new(rim, tire)
  end

  def ratio
    chainring / cog.to_f
  end
  
  def gear_inches
    ratio * wheel.diameter
  end
  
  Wheel = Struct.new(:rim, :tire) do
    def diameter
      rim + (tire * 2)
    end
  end
end

# Now we have a Wheel that can calculate its own diameter
# Embedding Wheel in Gear is not a long-term design goal
# but suggests that Wheel will exist only in the context of Gear
# not common intuition, but adequate to the occasion
 
 