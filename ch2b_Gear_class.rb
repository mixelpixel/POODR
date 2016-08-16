=begin
http://pdf.th7.cn/down/files/1502/Practical%20Object-Oriented%20Design%20in%20Ruby.pdf
Chapter 2: Designing Classes with a Single Responsibility
=end

# A Class with a single responsibility

class Gear
 attr_reader :chainring, :cog
  def initialize(chainring, cog)
    @chainring = chainring
    @cog       = cog
  end
  
  def ratio
    chainring / cog.to_f # <<< THE ROAD TO RUIN!!!
  end
end

puts Gear.new(52, 11).ratio # -> 4.72727272727275
puts Gear.new(30, 27).ratio # -> 1.11111111111111

