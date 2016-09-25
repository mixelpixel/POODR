=begin
http://pdf.th7.cn/down/files/1502/Practical%20Object-Oriented%20Design%20in%20Ruby.pdf
Chapter 3. Managing Dependencies, Understanding Dependencies pg.49
=end

# You can also completely remove the defaults from initialize and isolate them
# inside of a separate wrapping method. The defaults method below defines a second
# hash that is merged into the options hash during initialization. In this case, merge
# has the same effect as fetch; the defaults will get merged only if their keys are not in
# the hash.


# specifying defaults by merging a defaults hash
  def initialize(args)
    args = defaults.merge(args)
    @chainring = args[:chainring]
# ...
  end

  def defaults
    {:chainring => 40, :cog => 18}
  end
  
# This isolation technique is perfectly reasonable for the case above but it’s especially
# useful when the defaults are more complicated. If your defaults are more than simple
# numbers or strings, implement a defaults method.
