=begin
http://pdf.th7.cn/down/files/1502/Practical%20Object-Oriented%20Design%20in%20Ruby.pdf
Chapter 2: Designing Classes with a Single Responsibility, pg.28
=end

# Hide Data Structure

class RevealingReferences
  attr_reader :wheels
  def initialize(data)
    @wheels = wheelify(data)
  end
  
  def diameters
    wheel.collect {|wheel|
      wheel.rim + (wheel.tire * 2)}
  end
  # now everyone can send rim/tire to wheel
  
  Wheel = Struct.new(:rim, :tire)
  def wheelify(data)
    data.collect {|cell|
      Wheel.new(cell[0], cell[1])}
  end
end

# NOTE diameters method knows NOTHING of the internal structure of the array.

