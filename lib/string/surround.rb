# ## String#surround(before, after)
#
# Surrounds string with before/after strings.
#
# Usage:
# ```ruby
# 'test'.surround('(', ')') # => '(test)'
# 'test'.surround('|') # => '|test|'
# ```
#
# Note: for symmetry, some could ask for `#append` and `#prepend`... but
# I've never felt a need for this.
class String
  def surround(before, after = before)
    "#{before}#{self}#{after}"
  end
end
