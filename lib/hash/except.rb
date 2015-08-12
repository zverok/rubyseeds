# ## Hash#except(*keys)
#
# Returns the hash without keys specified.
#
# Usage:
# ```ruby
# {a: 1, b: 2, c: 3, d: 4}.except(:a, :c) # => {b: 2, d: 4}
# ```
class Hash
  def except(*keys)
    reject { |k, _v| keys.include?(k) }
  end
end
