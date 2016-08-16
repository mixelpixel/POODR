=begin
http://pdf.th7.cn/down/files/1502/Practical%20Object-Oriented%20Design%20in%20Ruby.pdf
Chapter 2: Designing Classes with a Single Responsibility, p.18
=end

# a procedure for determining the gear ratio

chainring = 52 #number of teeth
cog = 11
ratio = chainring / cog.to_f
puts ratio # -> 4.72727272727275

chainring = 30
cog = 27
puts ratio # -> 4.72727272727275 OT: NOTE HOW THE VARIABLE VALUE DOES NOT RECALCULATE
ratio = chainring / cog.to_f
puts ratio # -> 1.11111111111111

