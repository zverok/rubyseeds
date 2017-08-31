# ## Enumerable#fraction -- fraction of items in a whole
#
# Counts the part of collection which returns `true` for a block,
# relative to entire collection size.
#
# Usage:
#
# ```ruby
# ['test', 'me', 'heck'].fraction { |s| s.include?('t') } # => 1/3
# ```
#
module Enumerable
  def fraction(&block)
    whole, frac = inject([0, 0]) { |(w, f), i| [w + 1, f + (block.call(i) ? 1 : 0)] }
    whole.zero? ? Rational(1) : Rational(frac, whole)
  end
end
