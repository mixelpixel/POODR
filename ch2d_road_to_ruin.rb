=begin
http://pdf.th7.cn/down/files/1502/Practical%20Object-Oriented%20Design%20in%20Ruby.pdf
Chapter 2: Designing Classes with a Single Responsibility, pg.24
=end

# Hidden Instance Variables:
# Always wrap instance variables in accessor methods
# instead of directly referring to variables, like
# the ratio method does below:

class Gear
  def initialize(chainring, cog)
    @chainring = chainring
    @cog       = cog
  end
  
  def ratio
    @chainring / @cog.to_f    # <--- THE ROAD TO RUIN!!!!!!!!!!!!!!!!!
  end
end

# Instead, Hide the variables, even from the class that defines them, by wrapping them in methods

