=begin
http://pdf.th7.cn/down/files/1502/Practical%20Object-Oriented%20Design%20in%20Ruby.pdf
CHAPTER 6 - Acquiring Behavior Through Inheritance, Embedding Multiple Types pg. 110
=end

class Bicycle
  attr_reader :style, :size, :tape_color,
              :front_shock, :rear_shock

  def initialize(args)
    @style       = args[:style]
    @size        = args[:size]
    @tape_color  = args[:tape_color]
    @front_shock = args[:front_shock]
    @rear_shock  = args[:rear_shock]
  end

  # checking "style" starts down a slippery slope
  def spares
    if style == :road
      { chain:        '10-speed',
        tire_size:    '23',       # millimeters
        tape_color:   tape_color }
    else
      { chain:        '10-speed',
        tire_size:    '2.1',       # inches
        rear_shock:   rear_shock }
     end
  end

end


bike = Bicycle.new(
        style:       :mountain,
        size:        'S',
        front_shock: 'Manitou',
        rear_shock:  'Fox')

bike.spares
# -> {:tire_size  => "2.1",
#     :chain      => "10-speed",
#     :rear_shock => "Fox"}

# p 'bike is: ' + bike.to_s
# p 'bike.class is: ' + bike.class.to_s
# p 'bike.size is: ' + bike.size.to_s
# p 'bike.spares are: ' + bike.spares.to_s

puts 'bike is: ' + bike.to_s
puts 'bike.class is: ' + bike.class.to_s
puts 'bike.size is: ' + bike.size.to_s
puts 'bike.spares are: ' + bike.spares.to_s
puts 'bike.tape_color is: ' + bike.tape_color.to_s  # <-- NOTE the "nil" is not printed
p bike.tape_color                                   # <-- NOTE the "nil" IS printed
puts bike.tape_color                                # <-- NOTE the "nil" is not printed
puts bike.tape_color.nil?                           # <-- true
puts bike.nil?                                      # <-- false
puts bike.tape_color.class
puts bike.style

