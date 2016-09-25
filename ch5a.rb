=begin
http://pdf.th7.cn/down/files/1502/Practical%20Object-Oriented%20Design%20in%20Ruby.pdf
CHAPTER 5 - Reducing Costs with Duck Typing pg.87
NOTE see figure 5.1 (pg. 88) for the corresponding UML (UNIFIED MODELING LANGUAGE) diagram
NOTE see also figure 4.6 (pg. 70)
=end

# Overlooking the Duck
# In the following code Trip’s prepare method sends message prepare_bicycles to
# the object contained in its mechanic parameter. Notice that the Mechanic class is
# not referenced; even though the parameter name is mechanic, the object it contains
# could be of any class.

class Trip
  attr_reader :bicycles, :customers, :vehicle
  
  # this 'mechanic' argument could be of any class
  def prepare(mechanic)
    mechanic.prepare_bicycles(bicycles)
  end
  
  # ...
end

# if you happen to pass an instance of *this* class
# it works
class Mechanic
  def prepare_bicycles(bicycles)
    bicycles.each {|bicycle| prepare_bicycle(bicycle)}
  end
  
  def prepare_bicycle(bicycle)
    # ...
  end
end

# The prepare method has no explicit dependency on the Mechanic class but it does
# depend on receiving an object that can respond to prepare_bicycles. This dependency
# is so fundamental that it’s easy to miss or to discount, but nonetheless, it exists.
# Trip’s prepare method firmly believes that its argument contains a preparer of bicycles.
