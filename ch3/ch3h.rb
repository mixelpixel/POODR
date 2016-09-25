=begin
http://pdf.th7.cn/down/files/1502/Practical%20Object-Oriented%20Design%20in%20Ruby.pdf
Chapter 3. Managing Dependencies, Understanding Dependencies pg.48
=end

# specifying defaults using ||
# "Conditional Assignment" - like an "OR" condition

  def initialize(args)
    @chainring = args[:chainring] || 40
    @cog       = args[:cog]       || 18
    @wheel     = args[:wheel]
  end

# USE THIS TECHNIQUE WITH CAUTION
# This is a common technique but one you should use with caution; there are situations
# in which it might not do what you want. The || method acts as an or condition; it
# first evaluates the left-hand expression and then, if the expression returns false or
# nil, proceeds to evaluate and return the result of the right-hand expression. The use
# of || above therefore, relies on the fact that the [] method of Hash returns nil for
# missing keys.
# In the case where args contains a :boolean_thing key that defaults to true, use
# of || in this way makes it impossible for the caller to ever explicitly set the final variable
# to false or nil. For example, the following expression sets @bool to true when
# :boolean_thing is missing and also when it is present but set to false or nil:

@bool = args[:boolean_thing] || true

