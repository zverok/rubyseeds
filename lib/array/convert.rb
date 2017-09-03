# ## Array#convert(*conversions) -- per item array processing
#
# Processes each item of array with method provided.
#
# Usage:
# ```ruby
# # Code without convert:
# arr = 'test;10;84.0;2015-08-01'.split(';')
# return [arr[0], arr[1].to_i, arr[2].to_f, Time.parse(arr[3])]
#
# # Code with convert:
# return 'test;10;84.0;2015-08-01'.split(';').
#   convert(:to_s, :to_i, :to_f, Time.method(:parse))
# ```
# Conversions can be:
# * symbol (sent to array item);
# * proc or method (called with array item as an argument)
# * nil (no conversion).
#
# **Note**: if you'll use this method heavy, you may think of more
# complicated implementation, with default values, errors processing and
# stuff. But its out of scope of RubySeeds.
class Array
  def convert(*conversions)
    zip(conversions).map do |val, conv|
      case conv
      when Symbol       then val.send(conv)
      when Proc, Method then conv.call(val)
      when nil          then val
      else
        raise ArgumentError,
              "Can't append conversion of #{conv.class} to #{val.class}"
      end
    end
  end
end
