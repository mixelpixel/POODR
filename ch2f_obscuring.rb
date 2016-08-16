=begin
http://pdf.th7.cn/down/files/1502/Practical%20Object-Oriented%20Design%20in%20Ruby.pdf
Chapter 2: Designing Classes with a Single Responsibility, pg.26
=end

# Hide Data Structure

class ObscuringReferences
  attr_reader :data
  def initialize(data)
    @data = data
  end
  
  def diameters
    # 0 is rim, 1 is tire
    data.collect {|cell|
      cell[0] + (cell[1] * 2)}
  end
  # ... many other methods that index into the array
end


=begin
This class expects to be initialized with a
two-dimensional array of rims and tires, e.g.

# rim and tire sizes (now in millimeters!) in a 2d array
@data = [[622, 20], [622, 23], [559, 30], [559, 40]]

IF THE DATA STRUCTURE CHANGES THEN THIS CODE MUST CHANGE.
@data contains a complicated data structure - just hiding the variable is not enough

References to complicated data structures are leaky
The knowledge that rims are at [0] and tires at [1] should not be duplicated - just known in one place


=end