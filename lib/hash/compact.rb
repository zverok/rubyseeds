# ## Hash#compact
#
# Drop the nil values from hash (just like `Array#compact` do for arrays).
#
# Usage:
# ```ruby
# {a: 1, b: nil, c: 3, d: nil}.compact # => {a: 1, c: 3}
# ```
class Hash
  def compact!
    reject! { |_k, v| v.nil? }
    self
  end

  def compact
    dup.compact!
  end
end
