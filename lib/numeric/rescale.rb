# ## Numeric: rescale to another range (normalize)
#
# Rescales number from one known range to another.
# Useful for data normalization.
#
# **Note**: Depending on usage, you could consider types handling (int/float)
# too naive.
#
# Usage:
#
# ```ruby
# array = [1, -5, 84, -3.5, 12]
#
# array.map{|n| n.rescale(array.min..array.max, 0..100)}
# # => [6, 0, 100, 1.68, 19]
#
# ```
class Numeric
  def rescale(from, to)
    from_size = from.end - from.begin
    to_size = to.end - to.begin

    (self - from.begin) * to_size / from_size + to.begin
  end
end
