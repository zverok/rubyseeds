# ## Hash#only(*keys)
#
# Returns the hash, where ONLY the specified keys left.
#
# Usage:
# ```ruby
# {a: 1, b: 2, c: 3, d: 4}.only(:a, :c) # => {a: 1, c: 3}
# ```
class Hash
  def only(*keys)
    select { |k, _v| keys.include?(k) }
  end
end
