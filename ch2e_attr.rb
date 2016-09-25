=begin
http://pdf.th7.cn/down/files/1502/Practical%20Object-Oriented%20Design%20in%20Ruby.pdf
Chapter 2: Designing Classes with a Single Responsibility, pg.25
=end

# Hide the variables, even from the class that defines them, by wrapping them in
# methods. Ruby provides attr_reader as an easy way to create the encapsulating
# methods:

class Gear
  attr_reader :chainring, :cog  # <--------------
  def initialize(chainring, cog)
    @chainring = chainring
    @cog       = cog
  end
  
  def ratio
    chainring / cog.to_f        # <--------------
  end
end

# attr_reader causes Ruby to create a simple WRAPPER METHOD for the variables.

=begin
EXAMPLE:
Default implementation via attr_reader

  def cog
    @cog
  end
  
This method is now the only place in the code that understands what cog means.
"cog" becomes the result of a message send
Implementing this method changes cog from DATA (which is referenced all over)
to BEHAVIOR (which is defined once)

Changes in definition only need to happen at the wrapper,
e.g. a simple reimplementation of cog

  def cog
    @cog * unanticipated_adjustment_factor
  end

e.g. a moew complex one

  def cog
    @cog * (foo? ? bar_adjustment : baz_adjustment)
  end
  
  
=end

