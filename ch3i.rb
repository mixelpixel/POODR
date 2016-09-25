=begin
http://pdf.th7.cn/down/files/1502/Practical%20Object-Oriented%20Design%20in%20Ruby.pdf
Chapter 3. Managing Dependencies, Understanding Dependencies pg.49
=end

# In the example below, line 3 uses fetch to set @chainring to the default, 40,
# only if the :chainring key is not in the args hash. Setting the defaults in this way
# means that callers can actually cause @chainring to get set to false or nil, something
# that is not possible when using the || technique.

# specifying defaults using FETCH
  def initialize(args)
    @chainring = args.fetch(:chainring, 40)
    @cog = args.fetch(:cog, 18)
    @wheel = args[:wheel]
  end
 
 
