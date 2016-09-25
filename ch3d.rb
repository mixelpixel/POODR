=begin
http://pdf.th7.cn/down/files/1502/Practical%20Object-Oriented%20Design%20in%20Ruby.pdf
Chapter 3. Managing Dependencies, Understanding Dependencies pg.43
=end

=begin
In the first, creation of the new instance of Wheel has been moved from Gear’s
gear_inches method to Gear’s initialization method. This cleans up the gear_inches
method and publicly exposes the dependency in the initialize method. Notice that
this technique unconditionally creates a new Wheel each time a new Gear is created.
=end

class Gear
  attr_reader :chainring, :cog, :rim, :tire
  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog       = cog
    @wheel     = Wheel.new(rim, tire) # <-- Still depends on Wheel class but PUBLICLY EXPOSES it!
  end
  
  def gear_inches
    ratio * wheel.diameter
  end
# ...
end


=begin
The next alternative isolates creation of a new Wheel in its own explicitly defined
wheel method. This new method lazily creates a new instance of Wheel, using Ruby’s
||= operator. In this case, creation of a new instance of Wheel is deferred until
gear_inches invokes the new wheel method.
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
    ratio * wheel.diameter
  end
  
  def wheel
    @wheel ||= Wheel.new(rim, tire)      # <---- instance creation delayed until called
  end
# ...
end

