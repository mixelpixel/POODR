=begin
http://pdf.th7.cn/down/files/1502/Practical%20Object-Oriented%20Design%20in%20Ruby.pdf
Chapter 3. Managing Dependencies, Understanding Dependencies pg.36
=end

=begin
    An object depends on another object if, when one object changes, the other might be
forced to change in turn.
    Here’s a modified version of the Gear class, where Gear is initialized with four familiar
arguments. The gear_inches method uses two of them, rim and tire, to
create a new instance of Wheel. Wheel has not changed since you last you saw it in
Chapter 2, Designing Classes with a Single Responsibility.
=end


class Gear
  attr_reader :chainring, :cog, :rim, :tire
  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog       = cog
    @rim       = rim
    @tire      = tire
  end
  
  def gear_inches
    ratio * Wheel.new(rim, tire).diameter
  end
  
  def ratio
    chainring / cog.to_f
  end
# ...
end


class Wheel
  attr_reader :rim, :tire
  def initialize(rim, tire)
    @rim       = rim
    @tire      = tire
  end
  
  def diameter
    rim + (tire * 2)
  end
# ...
end


x = Gear.new(52, 11, 26, 1.5).gear_inches
p x
