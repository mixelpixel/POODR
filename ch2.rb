=begin
http://pdf.th7.cn/down/files/1502/Practical%20Object-Oriented%20Design%20in%20Ruby.pdf
Chapter 2: Designing Classes with a Single Responsibility
=end

# a procedure for determining the gear ratio

chainring = 52 #number of teeth
cog = 11
ratio = chainring / cog.to_f
puts ratio # -> 4.72727272727273

chainring = 30
cog = 27
puts ratio # -> 1.11111111111111


# A Class with a single responsibility

class Gear
 attr_reader :chainring, :cog
  def initialize(chainring, cog)
    @chainring = chainring
    @cog       = cog
  end
  
  def ratio
    chainring / cog.to_f
  end
end

puts Gear.new(52, 11).ratio # -> 4.72727272727273
puts Gear.new(30, 27).ratio # -> 1.11111111111111

