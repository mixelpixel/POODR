=begin
http://pdf.th7.cn/down/files/1502/Practical%20Object-Oriented%20Design%20in%20Ruby.pdf
CHAPTER 7 - Sharing Role Behavior with Modules, Writing the Concrete Code pg.148-149
=end



require_relative '7a.rb' # <-- class Schedule


class Bicycle
  attr_reader :schedule, :size, :chain, :tire_size

  # Inject the Schedule and provide a default
  def initialize(args={})
    @schedule = args[:schedule] || Schedule.new
    # ...
  end

  # Return true if this bicycle is available
  # during this (now Bicycle specific) interval.
  def schedulable?(start_date, end_date)
    !scheduled?(start_date - lead_days, end_date)
  end

  # Return the schedule's answer
  def scheduled?(start_date, end_date)
    schedule.scheduled?(self, start_date, end_date)
  end

  # Return the number of lead_days before a bicycle
  # can be scheduled.
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


