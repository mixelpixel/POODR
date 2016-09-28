=begin
http://pdf.th7.cn/down/files/1502/Practical%20Object-Oriented%20Design%20in%20Ruby.pdf
CHAPTER 7 - Sharing Role Behavior with Modules, Extracting the Abstraction pg.151-152
=end



require_relative '7c.rb' # <-- module Schedulable
require_relative '7a.rb' # <-- class Schedule


class Bicycle
  include Schedulable

  def lead_days
    1
  end

  # ...
end


require 'date'
starting = Date.parse("2015/09/04")
ending = Date.parse("2015/09/10")
b = Bicycle.new
b.schedulable?(starting, ending)
# This Bicycle is not scheduled
# between 2015-09-03 and 2015-09-10
# => true