=begin
http://pdf.th7.cn/down/files/1502/Practical%20Object-Oriented%20Design%20in%20Ruby.pdf
CHAPTER 7 - Sharing Role Behavior with Modules, Writing the Concrete Code pg. 144-148
=end



=begin
Assume that a Schedule class exists. Its interface already includes these three
methods:
scheduled?(target, starting, ending)
add(target, starting, ending)
remove(target, starting, ending)
=end


class Schedule
  def scheduled?(schedulable, start_date, end_date)
    puts "This #{schedulable.class} " +
         "is not scheduled\n" +
         "  between #{start_date} and #{end_date}"
    false
  end
end


# x = Schedule.new
# puts x.scheduled?(nil, "2015/09/04", "2015/09/10")