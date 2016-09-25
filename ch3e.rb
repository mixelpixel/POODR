=begin
http://pdf.th7.cn/down/files/1502/Practical%20Object-Oriented%20Design%20in%20Ruby.pdf
Chapter 3. Managing Dependencies, Understanding Dependencies pg.44 - 45
=end
# This script not for use, just to show the examples.


# the gear_inches method sends ratio and wheel to SELF, but sends diameter to wheel
def gear_inches
  ratio * wheel.diameter
end


def gear_inches
  #... a few lines of scary math
  foo = some_intermediate_result * wheel.diameter
  #... more lines of scary math
end

=begin
Now wheel.diameter is embedded deeply inside a complex method. This complex
method depends on Gear responding to wheel and on wheel responding to diameter.
Embedding this external dependency inside the gear_inches method is unnecessary
and increases its vulnerability. 
=end


# INSTEAD: REMOVE THE EXTERNAL DEPENDENCY AND 
# ENCAPSULATE (i.e. WRAPPING) THE DEPENDENCY IN ITS OWN METHOD, E.G.

def gear_inches
  #... a few lines of scary math
  foo = some_intermediate_result * diameter
  #... more lines of scary math
end

def diameter
  wheel.diameter
end





