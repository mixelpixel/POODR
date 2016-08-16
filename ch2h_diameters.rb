=begin
http://pdf.th7.cn/down/files/1502/Practical%20Object-Oriented%20Design%20in%20Ruby.pdf
Chapter 2: Designing Classes with a Single Responsibility, pg.28
=end

# Extract Extra Responsibilities from Methods

=begin
THIS method has TWO responsibilities

  def diameters
    wheel.collect {|wheel|
      wheel.rim + (wheel.tire * 2)}
  end

=end

# FIRST - iterate over the array
def diameters
  wheel.collect {|wheel| diameter(wheel)}
end

# SECOND - calculate the diameter of ONE wheel
def diameter(wheel)
  wheel.rim + (wheel.tire * 2)
end

=begin
Similarly this can be changed now

  def gear_inches
      # tire goes around rim twice for diameter
    ratio * (rim + (tire * 2))
  end

gear should not be calculating the wheel diameter - move the calculation to another method
  
=end


def gear_inches
  ratio * diameter
end

def diameter
  rim + (tire * 2)
end

